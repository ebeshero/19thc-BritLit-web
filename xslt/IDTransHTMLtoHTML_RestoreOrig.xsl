<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/> 
    
    
    <!--<xsl:template match="div[@class='poem']">
        <xsl:apply-templates select="descendant::div[@class='line']"/>
    </xsl:template>-->
    
    
    <xsl:template match="span[@class='num']"/>
</xsl:stylesheet>