import cds from '@sap/cds'
import { SELECT, UPDATE } from '@sap/cds/lib/ql/cds-ql.js'

export class ServicoLivraria extends cds.ApplicationService {
  init() {

    
    const { Livros, Autores } = cds.entities('ServicoLivraria')

    this.on('addDesconto', async () => {
      await UPDATE(Livros).set({
        preco: {
          func: 'ROUND',
          args: [{ xpr: [{ ref: ['preco'] }, '*', { val: 0.9 }] }, { val: 2 }]
        }
      })
    })

    this.on('addEstoque', Livros, async (req) => {
      const livroID = req.params[0].ID

      await UPDATE(Livros)
        .set({ estoque: { '+=': 1 } })
        .where({ ID: livroID })
    })

    this.on('alterarDataDePublicacao', Livros, async (req) => {
      const livroID = req.params[0].ID
      const novaData = req.data.novaData

      await UPDATE(Livros)
        .set({ dataDePublicacao: novaData })
        .where({ ID: livroID })
    })

    this.on('alterarStatus', Livros, async (req) => {
      const livroID = req.params[0].ID
      const novoStatus = req.data.novoStatus

      await UPDATE(Livros)
        .set({ status_codigo: novoStatus })
        .where({ ID: livroID })
    })

    this.before('READ', Livros, async () => {
      console.log('Before READ Livros')
    })

    this.on('READ', Livros, async (req, next) => {
      console.log('No evento')
      return next()
    })

    this.after('READ', Autores, async (autores) => {

      const listaAutores = Array.isArray(autores)
        ? autores
        : [autores]

      const ids = listaAutores.map(autor => autor.ID)

      const quantidadeDeLivros = await SELECT.from(Livros)
        .columns('autor_ID', { func: 'count', as: 'count' })
        .where({ autor_ID: { in: ids } })
        .groupBy('autor_ID')

      for (const autor of listaAutores) {

        const quantidadeDeLivro = quantidadeDeLivros.find(
          quantidadeDeLivro => quantidadeDeLivro.autor_ID === autor.ID
        )

        autor.quantidadeDeLivro = quantidadeDeLivro?.count || 0
      }
    })

    return super.init()
  }
}