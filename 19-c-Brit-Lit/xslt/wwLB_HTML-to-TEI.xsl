<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
 xpath-default-namespace="http://www.w3.org/1999/xhtml"
 xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
<!--2019-02-10 ebb: This is designed to up-convert my LyricalBallads_1800.html file to TEI, but doesn't generate fully valid TEI. A few steps remain to do by hand on The Rime of the Ancient Mariner, to wrap div elements around the Argument and the internal body of the poem, and to set the FIRST VOICE and SECOND VOICE into <sp> elements with <speaker> tags, moving their associated <lg> elements inside the <sp> for each. And pretty-print the final TEI document.  --> 
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
                            <titlePart type="sub"><xsl:apply-templates select="current()"/></titlePart>
                        </xsl:for-each> 
                    </docTitle>
                    <byline><xsl:apply-templates select="//div[@class='title']/h3"/></byline>
                            
                        
                   
                    <epigraph>
                        <cit>
                            <quote><xsl:apply-templates select="//div[@class='title']/h3/following-sibling::p[1]/text()"/></quote>
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
        <xsl:apply-templates select="h2"/>
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
    <xsl:template match="div[@class='poem'][not(@id='Foster-Mother')]">
    <div type="poem">     <xsl:apply-templates/>
    </div>
    </xsl:template>
    <xsl:template match="div[@class='poem' and @id='Foster-Mother']">
      <div type="poem"> <xsl:apply-templates select="*[position() le 4]"/>
      <xsl:for-each-group select="*[position() gt 4]" group-starting-with="h4" >
          <sp>
             
           <xsl:apply-templates select="current-group()" mode="Foster-Mother"/>  
              
          </sp>
      </xsl:for-each-group>
      
      
      </div>
    </xsl:template>
<xsl:template match="h4" mode="Foster-Mother"> <speaker><xsl:apply-templates/></speaker>
</xsl:template>

<xsl:template match="div[@class='line']" mode="Foster-Mother">
    <xsl:choose>
        <xsl:when test="child::span[contains(@class, 'indent')]">
            <l n="{child::span[@class='num']}" rend="{child::span[contains(@class, 'indent')]/@class}"><xsl:apply-templates select="child::span[@class='num']/following-sibling::node()"/></l>
        </xsl:when>
        <xsl:otherwise><l n="{child::span[@class='num']}"><xsl:apply-templates select="child::span[@class='num']/following-sibling::node()"/></l></xsl:otherwise></xsl:choose>
</xsl:template>   
    <xsl:template match="div[not(@class='title')]/h2">
        <head rend="h2"><xsl:apply-templates/></head>
    </xsl:template>
    <xsl:template match="div[not(@class='title')]/h3">
        <head rend="h3"><xsl:apply-templates/></head>
    </xsl:template>
    <xsl:template match="div[@class='lg']">
        <lg><xsl:apply-templates/></lg>
    </xsl:template>
    <xsl:template match="div[@class='line']">
       <xsl:choose>
           <xsl:when test="child::span[contains(@class, 'indent')]">
               <l n="{child::span[@class='num']}" rend="{child::span[contains(@class, 'indent')]/@class}"><xsl:apply-templates select="child::span[@class='num']/following-sibling::node()"/></l>
           </xsl:when>
           <xsl:otherwise><l n="{child::span[@class='num']}"><xsl:apply-templates select="child::span[@class='num']/following-sibling::node()"/></l></xsl:otherwise></xsl:choose>
    </xsl:template>
    
    <xsl:template match="div[@class='lg']/h4[matches(.,  '^[IVX]+\.$')]">
        <head><xsl:apply-templates/></head>
    </xsl:template>
    <xsl:template match="div[@class='footNote']"><note resp="#WW" anchored="false"><xsl:apply-templates/></note></xsl:template>
    <xsl:template match="span[@class='noteRef']">
        <note resp="#WW" anchored="true" n="{substring-after(., '[') ! substring-before(., ']')}"><xsl:apply-templates select="following::*[@class='footNote'][1]" mode="migrate"/></note>
    </xsl:template>
  <xsl:template match="span[@class='footNote']"/>
    <xsl:template match="span[@class='footNote']" mode="migrate">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="div[@class='section']">
        <div type="section">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="div[@class='section']/h4 | div[@class='poem']/h4">
        <head rend="h4"><xsl:apply-templates/></head>
    </xsl:template>
   
 
        
    
</xsl:stylesheet>