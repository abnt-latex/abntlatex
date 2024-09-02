%%
%% This is file `abntlatex.bst',
%%
%% This file is an *extensive* modification from a file generated with the docstrip utility.
%% The original source files were:
%% merlin.mbs  (with options: `head,exlang,lang,annote,seq-no,nm-rev,jnrlst,aunm-semi,yr-per,tit-it,atit-u,jttl-rm,thtit-a,vnum-nr,volp-com,jdt-pc,jwdpg,jwdvol,num-xser,isbn,issn,doi,blk-com,in-col,portuguese,pp,ed,abr,xedn,jabr,and-xcom,xand,etal-it,nfss,,{}')
%% portuges.mbs  (with options: `exlang,lang,annote,seq-no,nm-rev,jnrlst,aunm-semi,yr-per,tit-it,atit-u,jttl-rm,thtit-a,vnum-nr,volp-com,jdt-pc,jwdpg,jwdvol,num-xser,isbn,issn,doi,blk-com,in-col,portuguese,pp,ed,abr,xedn,jabr,and-xcom,xand,etal-it,nfss,,{}')
%% merlin.mbs  (with options: `tail,exlang,lang,annote,seq-no,nm-rev,jnrlst,aunm-semi,yr-per,tit-it,atit-u,jttl-rm,thtit-a,vnum-nr,volp-com,jdt-pc,jwdpg,jwdvol,num-xser,isbn,issn,doi,blk-com,in-col,portuguese,pp,ed,abr,xedn,jabr,and-xcom,xand,etal-it,nfss,,{}')
%% ----------------------------------------
%% *** abnt ***
%% 
%% Copyright 1994-2011 Patrick W Daly
 % ===============================================================
 % IMPORTANT NOTICE:
 % This bibliographic style (bst) file has been generated from one or
 % more master bibliographic style (mbs) files, listed above.
 %
 % This generated file can be redistributed and/or modified under the terms
 % of the LaTeX Project Public License Distributed from CTAN
 % archives in directory macros/latex/base/lppl.txt; either
 % version 1 of the License, or any later version.
 % ===============================================================
 % Name and version information of the main mbs file:
 % \ProvidesFile{merlin.mbs}[2011/11/18 4.33 (PWD, AO, DPC)]
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 % This bibliography style file is intended for texts in
 %   PORTUGUESE
 % This is a numerical citation style, and as such is standard LaTeX.
 % It requires no extra package to interface to the main text.
 % The form of the \bibitem entries is
 %   \bibitem{key}...
 % Usage of \cite is as follows:
 %   \cite{key} ==>>          [#]
 %   \cite[chap. 2]{key} ==>> [#, chap. 2]
 % where # is a number determined by the ordering in the reference list.
 % The order in the reference list is that by which the works were originally
 %   cited in the text, or that in the database.
 %---------------------------------------------------------------------

ENTRY
  {
    address
    annote
    author
    booktitle
    booksubtitle
    chapter
    doi
    edition
    editor organizer
    translated
    eid
    howpublished
    institution
    isbn
    issn
    journal
    key
    language
    month
    note
    number
    organization
    pages
    publisher
    dimensions %% NBR6023/2018 - 8.9 Dimensoes
    school
    series
    title
    subtitle
    type
    volume
    year
    year-presented
    conference-number conference-address conference-year
    url urldate
  }
  {}
  { label }
INTEGERS { output.state before.all mid.sentence after.sentence after.block }
FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}
STRINGS { s t}
FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}
FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}
FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}
FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
  annote missing$
    { "\bibAnnoteFile{" cite$ * "}" * write$ newline$ }
    { "\bibAnnote{" cite$ * "}{" * annote * "}" * write$ newline$
    }
  if$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}
FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}
FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
  skip$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}
FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}
FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}
FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}
FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}
FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}
FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}
FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}
FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}
FUNCTION {bold}
{ duplicate$ empty$
    { pop$ "" }
    { "\textbf{" swap$ * "}" * }
  if$
}
FUNCTION {tie.or.space.prefix}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$
}

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {space.word}
{ " " swap$ * " " * }
 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 %-------------------------------------------------------------------
 % Begin module:
 % \ProvidesFile{portuges.mbs}[2003/11/06 4.2 (PWD/RA)]

 % The language selected here is PORTUGUESE

%% NBR6023/2018 - Anexo B
FUNCTION {bbl.and}
{ "e"}

FUNCTION {bbl.etal}
{ "et~al." }

FUNCTION {bbl.sl}
{ "S.~l." }

FUNCTION {bbl.sn}
{ "S.~n." }

FUNCTION {bbl.editors}
{ "eds." }

FUNCTION {bbl.editor}
{ "ed." }

FUNCTION {bbl.organizer}
{ "org." }

FUNCTION {bbl.edby}
{ "editado por" }

FUNCTION {bbl.edition}
{ "ed." }

FUNCTION {bbl.volume}
{ "v." }

FUNCTION {bbl.of}
{ "de" }

FUNCTION {bbl.number}
{ "n." }

FUNCTION {bbl.nr}
{ "n\raise1ex\hbox{\underbar{\scriptsize o}}" }

FUNCTION {bbl.in}
{ "In" }

FUNCTION {bbl.pages}
{ "p." }

FUNCTION {bbl.page}
{ "p." }

FUNCTION {bbl.chapter}
{ "cap." }

FUNCTION {bbl.techrep}
{ "Rel.\ T\'ec." }

FUNCTION {bbl.thesis}
{ "Tese" }

FUNCTION {bbl.url.available}
{ "Dispon\'ivel em" }

FUNCTION {bbl.access.in}
{ "Acesso em" }

FUNCTION {bbl.translated}
{ "Tradu{\c{c}}{\~a}o" }

%% NBR6023/2018 - Anexo A
MACRO {jan} {"jan."}
MACRO {feb} {"fev."}
MACRO {mar} {"mar."}
MACRO {apr} {"abr."}
MACRO {may} {"maio"}
MACRO {jun} {"jun."}
MACRO {jul} {"jul."}
MACRO {aug} {"ago."}
MACRO {sep} {"set."}
MACRO {oct} {"out."}
MACRO {nov} {"nov."}
MACRO {dec} {"dez."}

 % End module: portuges.mbs
 %-------------------------------------------------------------------

FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}
FUNCTION {bibinfo.warn}
{ swap$
  duplicate$ missing$
    {
      swap$ "missing " swap$ * " in " * cite$ * warning$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ "empty " swap$ * " in " * cite$ * warning$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}
INTEGERS { nameptr namesleft numnames }

STRINGS  { bibinfo }

FUNCTION {format.names}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}{, f.}{, jj}"
      format.name$ "u" change.case$ 
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          nameptr #1
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { "; " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {
                  " " * bbl.etal emphasize *
                }
                { "; " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}
STRINGS { desc }
FUNCTION {format.names.desc}
{ 'bibinfo :=
  'desc :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}{, f.}{, jj}"
      format.name$ "u" change.case$ 
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          nameptr #1
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { "; " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {
                  " " * bbl.etal emphasize *
                }
                { "; " * t * }
              if$
            }
          if$
        }
        't
      if$
      t "others" =
        'skip$
        { " (" * desc * ")" * }
      if$

      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}

FUNCTION {get.bbl.editor} { editor num.names$ #1 > 'bbl.editors 'bbl.editor if$ }

FUNCTION {format.authors}
{ author "author" format.names
  editor empty$
    'skip$
    {
      author empty$
        'skip$
        {
          "; " *
        }
      if$
      editor bbl.editor "editor" format.names.desc *
    }
  if$
  organizer empty$
    'skip$
    {
      author empty$ editor empty$ and
        'skip$
        {
          "; " *
        }
      if$
      organizer bbl.organizer "organizer" format.names.desc *
    }
  if$
}
FUNCTION {format.isbn}
{ isbn "isbn" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      "ISBN " swap$ *
    }
  if$
}

FUNCTION {format.issn}
{ issn "issn" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      "ISSN " swap$ *
    }
  if$
}

FUNCTION {format.doi}
{ doi empty$
    { "" }
    {
      "\doi{" doi * "}" *
    }
  if$
}
FUNCTION {select.language}
{ duplicate$ empty$
    'pop$
    { language empty$
        'skip$
        { "{\selectlanguage{" language * "}" * swap$ * "}" * }
      if$
    }
    if$
}

FUNCTION {format.note}
{
 note empty$
    { "" }
    { note #1 #1 substring$
      duplicate$ "{" =
        'skip$
        {
        }
      if$
      note #2 global.max$ substring$ * "note" bibinfo.check
    }
  if$
}

%% NBR6023/2018 - 8.2 Titulo e Subtitulo
FUNCTION {format.title}
{
  title
  "title" bibinfo.check
  duplicate$ empty$ 
    'skip$
    {
      author empty$ organization empty$ and editor empty$ and organizer empty$ and
      {
        "u" change.case$
      }
      {
        "t" change.case$
      }
      if$
      subtitle empty$ 
      'skip$
      {
        subtitle ": " swap$ * "l" change.case$ *
      }
      if$
      select.language
    }
  if$
}
FUNCTION {format.translated}
{
  translated "translated" format.names
  duplicate$ empty$ 
    'skip$
    {
      bbl.translated ": " * swap$ *
    }
  if$
}
FUNCTION {format.organization}
{
  organization 
  "organization" bibinfo.check
   duplicate$ empty$ 
    'skip$
    {
      "u" change.case$
      select.language
    }
  if$
}
FUNCTION {format.authors.or.organization}
{ author empty$ editor empty$ and organizer empty$ and
    {
      format.organization
    }
    {
      format.authors
    }
  if$
}
FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

%% NBR6023/2018 - 8.6 Data
FUNCTION {format.urldate}
{
  urldate
  "urldate" bibinfo.check
  duplicate$ empty$ 
    'skip$
    {
      bbl.access.in ":\fmtdate{" * swap$ * "}" *
    }
  if$
} 

FUNCTION {word.url.available}
{ bbl.url.available
  ":" *
  " " * }

FUNCTION {format.url}
{
  url
  "url" bibinfo.check
  duplicate$ empty$ 
    'skip$
    {
      word.url.available "\url{" * swap$ * "}" *
      output new.sentence
      format.urldate
    }
  if$
}
FUNCTION {format.thesis.type}
{ type duplicate$ empty$
    'pop$
    { swap$ pop$
      "t" change.case$ "type" bibinfo.check
    }
  if$
}
FUNCTION {format.school.type}
{
  bbl.thesis format.thesis.type
  " - " * school "school" bibinfo.warn *
}

FUNCTION {n.dashify}
{
  't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ bbl.in
  emphasize
  ":" *
  " " * }

FUNCTION {format.date}
{
  month "month" bibinfo.check
  duplicate$ empty$
  year  "year"  bibinfo.check duplicate$ empty$
    { swap$ 
        'skip$
        { "there's a month but no year in " cite$ * warning$ }
      if$
      *
    }
    { swap$
        'skip$
        {
          swap$
          "\mm{" swap$ *
          "} " * swap$
        }
      if$
      *
    }
  if$
  duplicate$ empty$
    'skip$
    {
      %before.all 'output.state :=
      %after.sentence 'output.state :=
    }
  if$
}
FUNCTION{format.year}
{ year "year" bibinfo.check duplicate$ empty$
    {  "empty year in " cite$ *
       warning$
    }
    { }
  if$
}
FUNCTION {format.btitle}
{ title "title" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      bold
      subtitle empty$ 
      'skip$
      {
        subtitle ": " swap$ * "l" change.case$ *
      }
      if$
      select.language
    }
  if$
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}
FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.volume volume tie.or.space.prefix
      "volume" bibinfo.check * *
      series "series" bibinfo.check
      duplicate$ empty$ 'pop$
        { swap$ bbl.of space.word * swap$
          emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}
FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { series empty$
            { number "number" bibinfo.check }
            { output.state mid.sentence =
                { bbl.number }
                { bbl.number capitalize }
              if$
              number tie.or.space.prefix "number" bibinfo.check * *
              bbl.in space.word *
              series "series" bibinfo.check *
            }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition duplicate$ empty$ 'skip$
    {
      output.state mid.sentence =
        { "l" }
        { "t" }
      if$ change.case$
      "edition" bibinfo.check
      bbl.edition " " * 
      swap$ *
    }
  if$
}
FUNCTION {format.bedition}
{ edition duplicate$ empty$ 'skip$
    {
      output.state mid.sentence =
        { "l" }
        { "t" }
      if$ change.case$
      "edition" bibinfo.check
      " " * bbl.edition *
    }
  if$
}
INTEGERS { multiresult }
FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}
FUNCTION {format.pages}
{ pages duplicate$ empty$ 'skip$
    { duplicate$ multi.page.check
        {
          bbl.pages swap$
          n.dashify
        }
        {
          bbl.page swap$
        }
      if$
      tie.or.space.prefix
      "pages" bibinfo.check
      * *
    }
  if$
}
FUNCTION {format.volume}
{ volume
  "volume" bibinfo.check
  duplicate$ empty$ 
    'skip$
    {
      bbl.volume " " * swap$ *
    }
  if$
}
FUNCTION {format.number}
{ number
  "number" bibinfo.check
  duplicate$ empty$ 
    'skip$
    {
      bbl.number " " * swap$ *
    }
  if$
}
FUNCTION {format.vol.num.pages}
{ format.volume output
  format.number output
  %format.eid output
  format.pages output
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { bbl.chapter }
        { type "l" change.case$
          "type" bibinfo.check
        }
      if$
      chapter tie.or.space.prefix
      "chapter" bibinfo.check
      * *
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.booktitle}
{
  booktitle "booktitle" bibinfo.check
  bold
}
FUNCTION {format.in.ed.booktitle}
{ format.booktitle duplicate$ empty$ 'skip$
    {
      editor "editor" format.names duplicate$ empty$ 'pop$
        {
          "," *
          " " *
          get.bbl.editor
          ", " *
          * swap$
          * }
      if$
      word.in swap$ *
    }
  if$
}
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}
FUNCTION {format.article.crossref}
{
  key duplicate$ empty$
    { pop$
      journal duplicate$ empty$
        { "need key or journal for " cite$ * " to crossref " * crossref * warning$ }
        { "journal" bibinfo.check emphasize word.in swap$ * }
      if$
    }
    { word.in swap$ * " " *}
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  "editor" bibinfo.check
  editor num.names$ duplicate$
  #2 >
    { pop$
      "editor" bibinfo.check
      " " * bbl.etal
      emphasize
      *
    }
    { #2 <
        'skip$
        { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            {
              "editor" bibinfo.check
              " " * bbl.etal
              emphasize
              *
            }
            {
             bbl.and space.word
              * editor #2 "{vv~}{ll}" format.name$
              "editor" bibinfo.check
              *
            }
          if$
        }
      if$
    }
  if$
}
FUNCTION {format.book.crossref}
{ volume duplicate$ empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      pop$ word.in
    }
    { bbl.volume
      swap$ tie.or.space.prefix "volume" bibinfo.check * * bbl.of space.word *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { series emphasize * }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.incoll.inproc.crossref}
{
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { format.booktitle duplicate$ empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
            }
            { word.in swap$ * }
          if$
        }
        { word.in key * " " *}
      if$
    }
    { word.in format.crossref.editor * " " *}
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.address}
{
  address
  "address" bibinfo.check
  duplicate$ empty$ 
    {
      "[" bbl.sl emphasize * "]" * *
      %% TODO: mudar para apenas modo de aviso
      %%"address was replaced by [s.l.] in " cite$ * warning$
    }
    'skip$
  if$
}

FUNCTION {format.conference.info}
{ conference-number empty$
    'skip$
    {conference-number "." * output}
  if$
  conference-year empty$
    'skip$
    {conference-year output}
  if$
  conference-address empty$
    'skip$
    {conference-address output}
  if$
  new.sentence
}

%% NBR6023/2018 - 8.4 Local
FUNCTION {format.org.or.pub}
{ 't :=
  ""
  address empty$ t empty$ and
    'skip$
    {
      t empty$
        { format.address *
        }
        {
          format.address * ": " *
          t *
        }
      if$
    }
  if$
}

%% NBR6023/2018 - 8.5 Editora
FUNCTION {format.publisher.address}
{ publisher
  "publisher" bibinfo.check
  duplicate$ empty$ 
    {
      "[" bbl.sn emphasize * "]" * *
      %% TODO: mudar para apenas modo de aviso
      %%"publisher was replaced by [s.n.] in" cite$ * warning$
    }
    'skip$
  if$
  format.org.or.pub
}

FUNCTION {format.organization.address}
{ organization "organization" bibinfo.check format.org.or.pub
}

FUNCTION {format.journal.address}
{ journal 
  "journal" bibinfo.check 
  duplicate$ empty$
    'skip$
    {
      bold
    }
  if$ output
  format.address
}

%% TODO: 7.5 Correspondencia; 7.6 Correspondencia disponivel em meio eletronico; 7.7.4 Fasciculo, suplemento e outros; Patente; Documento juridico;

%% -----------------
%% 7.7 Publicacao periodica
FUNCTION {article}
{ output.bibitem
  format.authors.or.organization output new.sentence
  format.title "title" output.check new.block
  format.note output new.block
  format.journal.address output
  crossref missing$
    { format.vol.num.pages
      format.edition output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  format.date "year" output.check new.block
  crossref missing$
    { format.issn output new.block
      format.isbn output new.block
      format.doi output new.block
    }
    'skip$
  if$
  howpublished "howpublished" bibinfo.check output new.block
  format.url output
  fin.entry
}

 % destina-se a ser usado para artigos em uma coleção
FUNCTION {incollection}
{ output.bibitem
  format.authors.or.organization output new.sentence
  format.title "title" output.check new.block
  format.note output new.block
  crossref missing$
    { format.publisher.address output
      format.vol.num.pages
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  format.date "year" output.check new.block
  crossref missing$
    { 
      format.issn output new.block
      format.isbn output new.block
      format.doi output new.block
    }
    'skip$
  if$
  howpublished "howpublished" bibinfo.check output new.block
  format.url output
  fin.entry
}
%% -----------------

%% -----------------
%% 7.1 Monografia no todo
FUNCTION {book}
{ output.bibitem
  format.authors.or.organization "author or organization" bibinfo.warn output new.sentence
  format.btitle "title" bibinfo.warn output new.block
  format.translated output new.block
  crossref missing$
    { format.bedition output new.block
      format.bvolume output
      format.number.series output
      format.publisher.address output
    }
    {
      format.book.crossref output.nonnull
    }
  if$
  format.date "year" bibinfo.warn output new.block
  crossref missing$
    { 
      format.isbn output new.block
      format.doi output new.block
    }
    'skip$
  if$
  format.note output new.block
  dimensions "dimensions" bibinfo.check output new.block
  howpublished "howpublished" bibinfo.check output new.block
  format.url output
  fin.entry
}
FUNCTION {booklet}
{ output.bibitem
  format.authors.or.organization "author or organization" bibinfo.warn output new.sentence
  format.btitle "title" bibinfo.warn output new.block
  format.bedition output new.block
  format.bvolume output
  format.number.series output
  address "address" bibinfo.check output
  format.date "year" bibinfo.warn output new.block
  format.isbn output new.block
  format.doi output new.block
  format.note output
  fin.entry
}
FUNCTION {manual} { booklet }
FUNCTION {inbook}
{ output.bibitem
  format.authors.or.organization "author or organization" bibinfo.warn output new.sentence
  format.title "title" bibinfo.warn output new.block
  format.in.ed.booktitle "booktitle" output.check new.block
  crossref missing$
    { format.bedition output new.block
      format.bvolume output
      format.publisher.address output
      format.date "year" output.check new.block
      format.chapter.pages "chapter and pages" output.check
      format.number.series output
    }
    {
      format.chapter.pages "chapter and pages" output.check
      format.book.crossref output.nonnull
    }
  if$
  crossref missing$
    { 
      format.isbn output new.block
      format.doi output new.block
    }
    'skip$
  if$
  format.note output new.block
  dimensions "dimensions" bibinfo.check output new.block
  howpublished "howpublished" bibinfo.check output new.block
  format.url output
  fin.entry
}

FUNCTION {thesis}
{ output.bibitem
  format.authors "author" bibinfo.warn output new.sentence
  format.btitle "title" bibinfo.warn output new.block
  format.date "year" bibinfo.warn output new.block
  format.school.type "school and type" bibinfo.warn output
  address "address" bibinfo.check output
  year-presented "year-presented" bibinfo.check output
  format.note output new.block
  howpublished "howpublished" bibinfo.check output new.block
  format.url output
  fin.entry
}
FUNCTION {mastersthesis} { thesis }
FUNCTION {phdthesis} { thesis }
% -----------------

%% -----------------
%% 7.8 Evento
FUNCTION {proceedings}
{ output.bibitem
  format.authors.or.organization "author or organization" bibinfo.warn output new.sentence
  format.conference.info
  format.btitle "title" output.check new.block
  format.bvolume output
  format.volume output
  format.number.series output
  format.pages output
  format.publisher.address output
  format.date "year" output.check
  format.isbn output
  format.issn output
  format.doi output
  format.note output
  howpublished "howpublished" bibinfo.check output new.block
  format.url output
  fin.entry
}
FUNCTION {inproceedings}
{ output.bibitem
  format.authors output new.sentence
  format.title "title" output.check new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.conference.info
      publisher empty$
        { format.organization.address output }
        { organization "organization" bibinfo.check output
          format.publisher.address output
        }
      if$
      format.date "year" output.check
      format.pages output
      format.isbn output
      format.issn output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  format.doi output
  format.note output
  howpublished "howpublished" bibinfo.check output new.block
  format.url output
  fin.entry
}
FUNCTION {conference} { inproceedings }
% -----------------

FUNCTION {misc}
{ output.bibitem
  format.authors.or.organization "author or organization" bibinfo.warn output new.sentence
  format.btitle "title" output.check new.block
  format.note output
  format.publisher.address output
  format.date "year" output.check
  format.vol.num.pages
  format.edition output
  format.doi output
  dimensions "dimensions" bibinfo.check output new.block
  howpublished "howpublished" bibinfo.check output new.block
  format.url output
  fin.entry
  empty.misc.check
}

FUNCTION {techreport} { manual }

FUNCTION {unpublished}
{ output.bibitem
  format.authors.or.organization "author or organization" bibinfo.warn output new.sentence
  format.title "title" output.check new.block
  format.note "note" output.check
  format.date "year" output.check
  format.doi output
  format.url output
  fin.entry
}

FUNCTION {default.type} { misc }
READ
STRINGS { longest.label }
INTEGERS { number.label longest.label.width }
FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}
FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}
EXECUTE {initialize.longest.label}
ITERATE {longest.label.pass}
FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" *
  write$ newline$
  "\expandafter\ifx\csname urlstyle\endcsname\relax"
  write$ newline$
  "  \providecommand{\doi}[1]{DOI \discretionary{}{}{}#1}\else"
  write$ newline$
  "  \providecommand{\doi}{DOI \discretionary{}{}{}\begingroup \urlstyle{rm}\Url}\fi"
  write$ newline$
  "\providecommand{\selectlanguage}[1]{\relax}"
  write$ newline$
  "\providecommand{\bibAnnoteFile}[1]{%"
  write$ newline$
  "  \IfFileExists{#1}{\begin{quotation}\noindent\textsc{Key:} #1\\"
  write$ newline$
  "  \textsc{Annotation:}\ \input{#1}\end{quotation}}{}}"
  write$ newline$
  "\providecommand{\bibAnnote}[2]{%"
  write$ newline$
  "  \begin{quotation}\noindent\textsc{Key:} #1\\"
  write$ newline$
  "  \textsc{Annotation:}\ #2\end{quotation}}"
  write$ newline$
  "  \def\ddmmyyyyi#1/#2/#3\relax{\ddmmyyyy#1-#2-#3\relax}"
  write$ newline$
  "  \def\ddmmyyyy#1-#2-#3\relax{#1\space de\space\mm{#2}\space de\space#3}"
  write$ newline$
  "  \def\mm#1{\ifnum0<0#1\relax"
  write$ newline$
  "  {\ifcase#1 jan.\or jan.\or fev.\or mar.\or abr.\or mai.\or jun.\or jul.\or ago.\or set.\or out.\or nov.\or dez.\fi}"
  write$ newline$
  "  \else#1\fi}"
  write$ newline$
  "  \makeatletter"
  write$ newline$
  "  \def\instring#1#2{TT\fi\begingroup"
  write$ newline$
  "    \edef\x{\endgroup\noexpand\in@{#1}{#2}}\x\ifin@}"
  write$ newline$
  "  \makeatother"
  write$ newline$
  "  \def\fmtdate#1{"
  write$ newline$
  "  \if\instring{-}{#1}\ddmmyyyy#1\relax\else"
  write$ newline$
  "  \if\instring{/}{#1}\ddmmyyyyi#1\relax\fi\fi}"
  write$ newline$
}
EXECUTE {begin.bib}
EXECUTE {init.state.consts}
ITERATE {call.type$}
FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}
EXECUTE {end.bib}
%% End of customized bst file
%%
%% End of file `abntlatex.bst'.
