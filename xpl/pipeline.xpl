<p:pipeline xmlns:p="http://www.orbeon.com/oxf/pipeline" xmlns:xu="http://www.xmldb.org/xupdate" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxf="http://www.orbeon.com/oxf/processors" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xdb="http://orbeon.org/oxf/xml/xmldb">
   <p:param type="input" name="taxonid"/>
   <p:param type="output" name="taxon"/>
   <p:processor name="oxf:request">
      <p:input name="config">
         <config>
            <include>/request/parameters</include>
         </config>
      </p:input>
      <p:output name="data" id="request"/>
   </p:processor>
    <p:processor name="oxf:pipeline">
        <p:input name="request" href="#request"/>
        <p:input name="config" href="get-taxon.xpl"/>
        <p:input name="query" href="#taxonid"/>
        <p:output name="taxon" ref="taxon" id="result-taxon"/>
    </p:processor>
</p:pipeline>    