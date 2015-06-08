<?xml version="1.0" encoding="UTF-8"?>
<p:config xmlns:p="http://www.orbeon.com/oxf/pipeline" xmlns:xu="http://www.xmldb.org/xupdate" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxf="http://www.orbeon.com/oxf/processors" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xdb="http://orbeon.org/oxf/xml/xmldb">
    <p:param type="input" name="query"/>
    <p:param type="output" name="taxon"/>
    <p:processor name="oxf:xslt">
        <p:input name="data" href="#query"/>
        <p:input name="config">
            <xdb:query collection="/db/apps/blumenbach/data/werke-fix" create-collection="true" xsl:version="2.0">
            xquery version "1.0";
            <TEI>
                {for $taxon in //tei:classCode[@scheme='taxon']
                let $title := $taxon/ancestor::tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title
                where $taxon/text() = '<xsl:value-of select="/taxonid"/>'
                return <title>{$title}</title>}
            </TEI>
            </xdb:query>
        </p:input>
        <p:output name="data" id="xmldb-query"/>
     </p:processor>
    <p:processor name="oxf:xmldb-query">
            <p:input name="datasource" href="datasource.xml"/>
            <p:input name="query" href="#xmldb-query"/>
            <p:output name="data" ref="taxon"/>
    </p:processor>    
</p:config>