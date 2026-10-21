using {db} from '../db/schema';

service ServicoLivraria {
    @(restrict:[{grant:['READ', 'WRITE'], to: 'admin'},{grant:['READ'], to: 'authenticated-user'}])
    entity Livros      as projection on db.Livros
        actions {
            @Common.SideEffects : {TargetProperties: ['estoque']  }
            action addEstoque();
            action alterarDataDePublicacao(novaData: Date);
            @Common.SideEffects : {TargetProperties: ['status_codigo']  }
            action alterarStatus( @(Common: {
                                      ValueListWithFixedValues: true,
                                      Label : 'Novo Status',
                                      ValueList               : {
                                          $Type         : 'Common.ValueListType',
                                          CollectionPath: 'LivroStatus',
                                          Parameters    : [{
                                              $Type            : 'Common.ValueListParameterInOut',
                                              LocalDataProperty: novoStatus,
                                              ValueListProperty: 'codigo',
                                          }, ],
                                      },
                                  })
                                  novoStatus: String);
        };
    @Common.SideEffects : {TargetEntities:['/ServicoLivraria.EntityContainer/Livros'] }
    @(requires: ['vendedor-action','admin'])
    
    action addDesconto();
    entity Autores     as projection on db.Autores;
    entity Capitulos   as projection on db.Capitulos;
    entity LivroStatus as projection on db.LivroStatus;
    entity GenerosVH   as projection on db.Generos;
}
annotate ServicoLivraria.Autores with @requires: 'admin'