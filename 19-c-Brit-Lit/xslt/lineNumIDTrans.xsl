<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/> 
    
    <xsl:template match="l">
        <l n="{count(preceding::l)+1}"><xsl:apply-templates/></l>
     <!--  <xsl:choose> 
          <xsl:when test="count(preceding-sibling::l) = 1 or count(preceding-sibling::l) = 4">
              <l rend="indent" n="{count(preceding::l)+1}"><xsl:apply-templates/></l>     
              
          </xsl:when> 
           <xsl:otherwise><l n="{count(preceding::l)+1}"><xsl:apply-templates/></l></xsl:otherwise></xsl:choose>-->
    </xsl:template>
    
</xsl:stylesheet>