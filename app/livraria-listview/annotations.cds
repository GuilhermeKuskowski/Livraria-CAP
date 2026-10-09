using ServicoLivraria as service from '../../srv/service';
annotate service.Livros with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Data de Publicação',
                Value : dataDePublicacao,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Preço',
                Value : preco,
            },
            {
                $Type : 'UI.DataField',
                Value : pagina,
                Label : 'Páginas',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Informações Gerais',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Informações de Entrada',
            ID : 'Informaes',
            Target : '@UI.FieldGroup#Informaes',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Capítlos',
            ID : 'Captlos',
            Target : 'Capitulos/@UI.LineItem#Captlos',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Título',
            Value : titulo,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Gênero',
            Value : genero,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Data de Publicação',
            Value : dataDePublicacao,
        },
        {
            $Type : 'UI.DataField',
            Value : pagina,
            Label : 'pagina',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Preço',
            Value : preco,
        },
        {
            $Type : 'UI.DataField',
            Value : autor.nome,
            Label : 'Nome do Autor',
        },
    ],
    UI.SelectionFields : [
        preco,
    ],
    UI.HeaderInfo : {
        TypeName : 'Livro',
        TypeNamePlural : 'Livros',
        Title : {
            $Type : 'UI.DataField',
            Value : titulo,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : genero,
        },
        TypeImageUrl : 'sap-icon://course-book',
    },
    UI.FieldGroup #Informaes : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
        ],
    },
    UI.FieldGroup #Captulos : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
);

annotate service.Livros with {
    autor @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Autores',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : autor_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'nome',
            },
        ],
    }
};

annotate service.Livros with {
    preco @Common.Label : 'Preço'
};

annotate service.Capitulos with @(
    UI.LineItem #Captlos : [
        {
            $Type : 'UI.DataField',
            Value : livro.Capitulos.titulo,
            Label : 'Título',
        },
        {
            $Type : 'UI.DataField',
            Value : livro.Capitulos.pagina,
            Label : 'Páginas',
        },
        {
            $Type : 'UI.DataField',
            Value : livro.Capitulos.numero,
            Label : 'Número',
        },
    ]
);

