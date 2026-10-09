using {db} from '../db/schema';

service ServicoLivraria {
    entity Livros as projection on db.Livros;
    entity Autores as projection on db.Autores;
    entity Capitulos as projection on db.Capitulos;
} 