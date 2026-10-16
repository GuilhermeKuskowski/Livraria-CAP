using {db} from '../db/schema';

service ServicoLivraria {
    entity Livros      as projection on db.Livros
        actions {
            action addEstoque();
            action alterarDataDePublicacao(novaData: Date);
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

    entity Autores     as projection on db.Autores;
    entity Capitulos   as projection on db.Capitulos;
    entity LivroStatus as projection on db.LivroStatus;
    entity GenerosVH   as projection on db.Generos;
}
