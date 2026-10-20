using ServicoLivraria as service from '../../srv/service';
annotate service.Autores with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Ebook',
            ID : 'Ebook',
            Target : '@UI.FieldGroup#Ebook',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Informações dos Livros',
            ID : 'InformaesdosLivros',
            Target : '@UI.FieldGroup#InformaesdosLivros',
        },
    ],
    UI.FieldGroup #Ebook : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : conteudo,
                Label : 'Ebook Arquivo',
            },
        ],
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : livros.autor.nome,
            Label : 'Nome',
        },
    ],
    UI.FieldGroup #InformaesdosLivros : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : quantidadeDeLivro,
                Label : 'Quantidade de Livro',
            },
        ],
    },
);

