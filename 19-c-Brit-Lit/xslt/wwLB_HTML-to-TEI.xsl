<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
 xpath-default-namespace="http://www.w3.org/1999/xhtml"
 xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
<xsl:template match="/">
    <TEI>
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title level="m"><xsl:apply-templates select="//head/title"/></title>
                    <author xml:id="WW">William Wordsworth</author>
                    <editor xml:id="ebb">Elisa Beshero-Bondar</editor>
                </titleStmt>
                <publicationStmt>
                    <p>prepared for Elisa Beshero-Bondar’s course materials on <ref target="http://newtfire.org">newtFire</ref>.</p>
                </publicationStmt>
                <sourceDesc>
                    <p>This edition represents volume 1 only, and was adapted from <bibl><author>William Wordsworth</author>, <title level="m">Lyrical Ballads with other poems in two volumes</title>, <edition>Second edition</edition> (<pubPlace>London</pubPlace>: <publisher>Printed for T. N. Longman and O. Rees, Paternoster-Row, by Biggs and Co. Bristol</publisher>, <date>1800</date>); <ref target="http://www.gutenberg.org/cache/epub/8905/pg8905-images.html">the Project Gutenberg e-text of <date>2003</date></ref>.</bibl></p>
                </sourceDesc>
            </fileDesc>
        </teiHeader>
        <text>
            <front>
                <titlePage>
                    <docTitle>
                        <titlePart type="main"><xsl:apply-templates select="//div[@class='title']/h1"/></titlePart>
                        <xsl:for-each select="//div[@class='title']/h2">
                            <titlePart type="sub"><xsl:apply-templates select="."/></titlePart>
                            <byline><xsl:apply-templates select="//div[@class='title']/h3"/></byline>
                            
                        </xsl:for-each>
                    </docTitle>
                    <epigraph>
                        <cit>
                            <xsl:apply-templates select="//div[@class='title']/h3/following-sibling::p[1]/text()"/>
                            <note resp="#ebb">According to <bibl><author>J. Robert Barth</author> in <title level="m">The Symbolic Imagination: Coleridge and the Romantic Tradition</title> (<pubPlace>New York</pubPlace>: <publisher>Fordham University Press</publisher>, <date>2001</date>) <biblScope unit="page">64</biblScope></bibl>,  this can be loosely translated as <q>something not at all to your liking, Papinian!</q>, with  <q>Papiniane</q> humorously referring to <q>follower of Alexander Pope</q>.</note>     
                        </cit>
                    </epigraph>
                  <docEdition>SECOND EDITION.</docEdition>  
                    <docImprint><placeName>LONDON</placeName><lb/> PRINTED FOR <orgName>T. N. LONGMAN AND O. REES, PATERNOSTER-ROW</orgName>,<lb/>
                        BY <orgName>BIGGS AND
                            CO.</orgName> <placeName>BRISTOL</placeName>.
                        <date>1800</date>.
                    </docImprint>
                </titlePage>
                <div type="contents">
                  <xsl:apply-templates select="//div[@id='contents']"/> 
                </div>
            </front>
           <body>
              <xsl:apply-templates select="//div[@id='preface']"/>
             <xsl:apply-templates select="//div[@class='poem']"/>  
           </body> 
        </text>
    </TEI>
</xsl:template> 
    <xsl:template match="div[@id='contents']">
        <head><xsl:apply-templates select="h2"/></head>
        <xsl:apply-templates select="ul"/>
        
    </xsl:template>
    <xsl:template match="ul">
        <list>
            <xsl:apply-templates select="li"/>
        </list>
    </xsl:template>
    <xsl:template match="li">
        <item n="{count(preceding-sibling::li) + 1}"><xsl:apply-templates/></item>
    </xsl:template>
    <xsl:template match="a">
       <ref target="{@href}"> <xsl:apply-templates/>
       </ref>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="div[@class='poem']">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="h2">
        <head><xsl:apply-templates/></head>
    </xsl:template>
    <xsl:template match="div[@class='lg']">
        <lg><xsl:apply-templates/></lg>
    </xsl:template>
    <xsl:template match="div[@class='line']">
        <l n="{child::span[@class='num']}"><xsl:apply-templates select="child::span[@class='num']/following-sibling::node()"/></l>
    </xsl:template>
    <xsl:template match="div[@class='footNote']"><note resp="#WW"><xsl:apply-templates/></note></xsl:template>
</xsl:stylesheet>