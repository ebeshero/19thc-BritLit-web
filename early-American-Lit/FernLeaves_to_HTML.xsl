<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:apply-templates select="//titleStmt/title"/></title>
                <meta name="Description"
                    content="Supported by the University of Pittsburgh at Greensburg" />
                <meta name="keywords"
                    content="Fanny Fern, Sara Willis, Sara Willis Parton, 19th century, 19th-century, the nineteenth century, American Renaissance, US literature, women writers, American women newspaper columnists, American women journalists, digital scholarship, digital edition, electronic edition, electronic text, humanities computing, electronic editing, Beshero-Bondar" />
                <link rel="stylesheet" type="text/css" href="lit.css"/>
            </head>
            <body>
                <xsl:comment>#include virtual="top.html" </xsl:comment>  
                <h1><xsl:apply-templates select="//titleStmt/title"/></h1>
                <xsl:apply-templates select="//titleStmt/author"/>
                <xsl:apply-templates select="//text"/> 
                <p><xsl:apply-templates select="//sourceDesc/p"/></p>
                <p><span class="smaller">This edition was prepared in <a href="http://www.tei-c.org/index.xml">TEI, the language of the Text Encoding Initiative</a> and transformed to HTML for reading on the web. <a href="FernLeaves.xml">View this document in TEI XML.</a></span></p>
              
               
            </body>
        </html>     
    </xsl:template>
    <xsl:template match="author">
        <p id="byline">by <xsl:apply-templates select="persName"/>
            <span class="smaller"><xsl:apply-templates select="note"/></span></p>
        <xsl:apply-templates select="graphic"/>
    </xsl:template>
    <xsl:template match="graphic">
       <div id="imageHead"><img src="{@url}" alt="{desc}"/></div>
    </xsl:template>
    <xsl:template match="div[@type='article']">
        <div class="article"><h2><xsl:apply-templates select="head"/></h2>
            <span class="smaller"><xsl:apply-templates select="note[bibl]"/></span>
        <xsl:apply-templates select="*[not(. = note[bibl])]"/>
        <hr/></div>
    </xsl:template>
    <xsl:template match="note[bibl]">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="date">
        <xsl:apply-templates select="@when"/>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="q[not(lg)] | quote | soCalled">
        <q><xsl:apply-templates/></q>
    </xsl:template>
    <xsl:template match="q[lg]"/>
    <xsl:template match="emph">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    <xsl:template match="foreign">
        <span lang="{@xml:lang}"><xsl:apply-templates/></span>
    </xsl:template>
    
    
 <xsl:template match="ref">
     <a href="{@target}"><xsl:apply-templates/></a>
 </xsl:template>
    <xsl:template match="title[@level='m'] | title[@level='j']">
       <cite><xsl:apply-templates/></cite>
    </xsl:template>
    <xsl:template match="title[@level='a']">
    <xsl:text>“</xsl:text><xsl:apply-templates/><xsl:text>”</xsl:text>
    </xsl:template>
    <xsl:template match="biblScope[@unit='page']">
        <xsl:text>pages </xsl:text><xsl:apply-templates/>  </xsl:template>
    
    <xsl:template match="lg">
       <xsl:choose> <xsl:when test="parent::q">
            <div class="lg"><q><xsl:apply-templates/></q></div>
        </xsl:when>
        <xsl:otherwise><div class="lg"><xsl:apply-templates/></div></xsl:otherwise></xsl:choose>
    </xsl:template>
    
    <xsl:template match="l">
       
               <div class="line"><!--<span class="num"><xsl:apply-templates select="@n"/></span>--><xsl:apply-templates/></div>
               
    </xsl:template>
    
</xsl:stylesheet>