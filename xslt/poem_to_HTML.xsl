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
                    content="Charlotte Turner Smith, Charlotte Smith, 19th century, 19th-century, the nineteenth century, digital scholarship, digital edition, electronic edition, electronic text, humanities computing, electronic editing, Beshero-Bondar" />
                <link rel="stylesheet" type="text/css" href="poem.css"/>
            </head>
            <body>
                <h1><xsl:apply-templates select="//titleStmt/title"/></h1>
                <h2><xsl:apply-templates select="//titleStmt/author"/></h2>
                <p><xsl:apply-templates select="//sourceDesc/p"/></p>
                <p><span class="smaller"><xsl:apply-templates select="//publicationStmt"/></span></p>
              <xsl:apply-templates select="//text"/> 
            </body>
        </html>     
    </xsl:template>
    
 <xsl:template match="ref">
     <a href="{@target}"><xsl:apply-templates/></a>
 </xsl:template>
    <xsl:template match="title[@level='m']">
       <cite><xsl:apply-templates/></cite>
    </xsl:template>
    <xsl:template match="title[@level='a']">
    <xsl:text>“</xsl:text><xsl:apply-templates/><xsl:text>”</xsl:text>
    </xsl:template>
    <xsl:template match="biblScope[@unit='page']">
        <xsl:text>pages </xsl:text><xsl:apply-templates/>  </xsl:template>
    
    <xsl:template match="lg">
        <div class="lg"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="l">
       <xsl:choose> 
          <xsl:when test="count(preceding-sibling::l) = 1 or count(preceding-sibling::l) = 4">
              <div class="line"><span class="num"><xsl:apply-templates select="@n"/></span><span class="indent"><xsl:apply-templates/></span></div>
              
          </xsl:when> 
           <xsl:otherwise>
               <div class="line"><span class="num"><xsl:apply-templates select="@n"/></span><xsl:apply-templates/></div>
               
           </xsl:otherwise>
       </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>