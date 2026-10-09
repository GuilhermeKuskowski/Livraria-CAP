using {
    cuid,
    managed
} from '@sap/cds/common';

namespace db;

entity Livros : cuid, managed {
    titulo           : String;
    autor            : Association to Autores;
    genero           : String;
    dataDePublicacao : Date;
    pagina           : Integer;
    preco            : Decimal(9, 2);
    estoque          : Integer;
    status           : Association to LivroStatus;
    Capitulos        : Composition of many Capitulos
                           on Capitulos.livro = $self;
}

entity LivroStatus {
    key codigo          : String(1) enum {
            Disponível = 'D';
            Low_Estoque = 'L';
            Indisponível = 'I';
        };
        criticidade     : Integer;
        textoDeExibicao : String;
}


entity Autores : cuid, managed {
    nome   : String;
    livros : Association to many Livros
                 on livros.autor = $self;
}

entity Capitulos : cuid, managed {
    key livro  : Association to Livros;
        numero : Integer;
        titulo : String;
        pagina : Integer;

}
