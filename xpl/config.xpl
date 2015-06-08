<?xml version="1.0" encoding="UTF-8"?>
<p:config xmlns:p="http://www.orbeon.com/oxf/pipeline" xmlns:xu="http://www.xmldb.org/xupdate" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxf="http://www.orbeon.com/oxf/processors" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xdb="http://orbeon.org/oxf/xml/xmldb">
    <p:param type="input" name="query"/>
    <p:param type="output" name="data"/>
    <p:processor name="oxf:xmldb-query">
        <p:input name="datasource" href="datasource.xml"/>
        <p:input name="query">
        <xdb:query collection="/db/apps/blumenbach/data/werke-fix" create-collection="true">
        xquery version "1.0";
        <TEI>
            { let $taxons := //tei:classCode[@scheme='taxon']
            let $last_idno := max($taxons)
            let $new_id := $last_idno + 1
            return <new_id>{$new_id}</new_id>}
        </TEI>
        </xdb:query>
        </p:input>
        <p:output name="data" ref="data"/>
     </p:processor>
</p:config>