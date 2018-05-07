<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <h1><xsl:value-of select="ies/@nombre"/></h1> 
        <xsl:apply-templates select="//ciclo"></xsl:apply-templates>
        <!-- con el value-of lo sacamos como si fuera xPath -->
    </xsl:template>
    
    <xsl:template match="//ciclo"> <!-- este //ciclo enlaza con el de arriba -->
        <p><xsl:value-of select="nombre"/></p>
    </xsl:template>
    
</xsl:stylesheet>