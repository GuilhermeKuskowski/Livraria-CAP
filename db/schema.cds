using {
    cuid,
    managed,
    sap.common.Currencies
} from '@sap/cds/common';
using { Attachments } from '@cap-js/attachments';
namespace db;

@odata.draft.enabled
entity Livros : cuid, managed {
    titulo           : String;
    autor            : Association to Autores;
    genero           : Association to Generos;
    dataDePublicacao : Date;
    pagina           : Integer;
    preco            : Decimal(9, 2);
    moeda            : Association to Currencies;
    estoque          : Integer;
    status           : Association to LivroStatus;
    Capitulos        : Composition of many Capitulos
                           on Capitulos.livro = $self;
}

entity Generos {
    key codigo    : Genero;
        descricao : String;
}

type Genero : String enum {
    Romance = 'Romance';
    Ficcao = 'Ficcao';
    Aventura = 'Aventura';
    Drama = 'Drama';
    Infantil = 'Infantil';
    Poesia = 'Poesia';
    Comedia = 'Comedia';
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

@odata.draft.enabled
entity Autores : cuid, managed {
    nome          : String;
    nomeDoArquivo : String;
    tipoDoArquivo : String      @Core.IsMediaType;
    conteudo      : LargeBinary @Core.MediaType                  : tipoDoArquivo
                                @Core.AcceptableMediaTypes : ['application/pdf']
                                @Core.ContentDisposition.Filename: nomeDoArquivo;
    attachments : Composition of many Attachments;                           
    livros        : Association to many Livros
                        on livros.autor = $self;
}

entity Capitulos : cuid, managed {
    key livro  : Association to Livros;
        numero : Integer;
        titulo : String;
        pagina : Integer;

}
