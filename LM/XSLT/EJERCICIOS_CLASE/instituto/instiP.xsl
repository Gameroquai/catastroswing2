<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
            <xsl:apply-templates select="//ciclo"/>        
    </xsl:template>
    <xsl:template match="ciclo">
        <p><xsl:value-of select="nombre"/></p>
        <xsl:value-of select="@id"/>
         Año del decreto : <xsl:value-of select="decretoTitulo/@año"/>
        <xsl:apply-templates select="nombre"/>
    </xsl:template>
    
   <xsl:template match="nombre">
       <xsl:value-of select="../grado"/>
       
   </xsl:template>
</xsl:stylesheet>