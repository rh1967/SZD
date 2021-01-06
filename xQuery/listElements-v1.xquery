
declare namespace teins = "http://www.tei-c.org/ns/1.0";
declare namespace functx = "http://www.functx.com";
declare function functx:distinct-element-names
  ( $nodes as node()* )  as xs:string* {

   (: distinct-values($nodes/descendant-or-self::*/name(.)) :)
   (: distinct-values($nodes[contains(.,"szdg")] ) :)
    distinct-values($nodes) 
 } ;

let $in-xml := (doc ("file:/C:/Users/rh/Git-PLUS/SZD/data/Library/tei/SZDBIB.xml")//biblFull//list/attribute() )
(:let $in-xml := (doc ("file:/C:/Users/rh/Git-PLUS/SZD/data/Library/SZDBIB.xml")//biblFull//element()[child::text() and not( child::element() )] )
:)
return
 functx:distinct-element-names($in-xml)

(:
//biblFull//provenance//attribute()[ contains(.,"de") and ( not( contains(.,"LaterOwner") ) ) ]
:)