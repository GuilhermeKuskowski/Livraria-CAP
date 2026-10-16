import cds from '@sap/cds'
import { UPDATE, where } from '@sap/cds/lib/ql/cds-ql.js'

export class ServicoLivraria extends cds.ApplicationService { init() {

  const { Livros } = cds.entities('ServicoLivraria')

  this.on('addEstoque',Livros,async(req) => {
    const livroID = req.params[0].ID
    await UPDATE(Livros)
    .set({estoque: {'+=' : 1}})
    .where ({ID:livroID})
  })
  this.on('alterarDataDePublicacao',Livros,async(req) => {
    const livroID = req.params[0].ID
    const novaData = req.data.novaData
    await UPDATE(Livros)
    .set({dataDePublicacao: novaData})
    .where ({ID:livroID})
  })
    this.on('alterarStatus',Livros,async(req) => {
    const livroID = req.params[0].ID
    const novoStatus = req.data.novoStatus
    await UPDATE(Livros)
    .set({status_codigo: novoStatus})
    .where ({ID:livroID})
  })
  this.before ('READ', Livros, async (req) => {
    console.log('Before READ Livros')
  })

  this.on('READ', Livros, async(req,next) => {
    console.log('No evento')
    return next()
  })
  this.after ('READ', Livros, async (livros, req) => {
    for(const livro of livros) {
      if (livro.genero_codigo === 'Drama') {
        livro.preco *= 0.8
      }
    }
    console.log('Depois do READ')
  })

  return super.init()
}}
