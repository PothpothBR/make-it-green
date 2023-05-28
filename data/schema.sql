create table saves (
    id integer primary key not null,
    data text notnull,
    dificuldade text notnull,
);


create table objetivos (
    id integer primary key not null,
    nome text not null,
    objetivo real not null,
    foreign key (id_saves) references saves(id)
    on delete cascade
);

create table itens (
    id integer primary key not null,
    nome text not null,
    descricao text default "",
    valor real not null,
    fator real default null
);

create table progressao_itens (
    id integer primary key not null,
    id_itens integer not null,
    id_saves integer not null,
    pos_x real default null,
    pos_y real default null,
    foreign key (id_saves) references saves(id)
    on delete cascade,
    foreign key (id_itens) references itens(id)
    on delete cascade
);

create table progressao_mundo (
    id integer primary key not null,
    id_saves integer not null,
    areas_completadas integer not null default 0,
    areas_x integer not null,
    areas_y integer not null,
    foreign key (id_saves) references saves(id)
    on delete cascade
);

create table progressao_objetivos (
    id integer primary key not null,
    id_save integer  not null,
    id_objetivos not null,
    valor real,
    foreign key (id_saves) references saves(id)
    on delete cascade,
    foreign key (id_objetivos) references objetivos(id)
    on delete cascade
);

create table progressao_jogador (
    id integer primary key not null
    id_saves integer not null,
    nome text notnull,
    points integer not null,
    foreign key (id_saves) references saves(id)
    on delete cascade
)