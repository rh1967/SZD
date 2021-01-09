
declare namespace teins = "http://www.tei-c.org/ns/1.0";
declare namespace functx = "http://www.functx.com";
declare function functx:distinct-element-names
  ( $nodes as node()* )  as xs:string* {

    distinct-values($nodes/descendant-or-self::*/name(.))  
   (: distinct-values($nodes[contains(.,"szdg")] ) :)
   (:  distinct-values($nodes) :)
 } ;


let $doc := (doc ("file:/C:/Users/rh/Git-PLUS/SZD/data/Work/tei/SZDMSK.xml")//biblFull)
(:let $in-xml := (doc ("file:/C:/Users/rh/Git-PLUS/SZD/data/Library/SZDBIB.xml")//biblFull//element()[child::text() and not( child::element() )] )
:)
return
<maxNum>
    {
        max(
for $node in $doc
return
    count( functx:distinct-element-names($node) ) 
)
    }
</maxNum>,
<Num>
{for $node in doc("file:/C:/Users/rh/Git-PLUS/SZD/data/Work/tei/SZDMSK.xml")//biblFull
return
    count( functx:distinct-element-names($node) )}
</Num>
(:
//biblFull//provenance//attribute()[ contains(.,"de") and ( not( contains(.,"LaterOwner") ) ) ]
:)