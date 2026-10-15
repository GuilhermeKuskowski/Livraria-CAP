import cds from '@sap/cds'

export class ServicoLivraria extends cds.ApplicationService { init() {

  const { Livros } = cds.entities('ServicoLivraria')

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
