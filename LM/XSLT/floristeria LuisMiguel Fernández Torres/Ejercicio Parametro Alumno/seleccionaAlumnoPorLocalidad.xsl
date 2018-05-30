<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:param name="parametroExternoLocalidad"/>
    <xsl:template match="/">
    <h1>Alumnos en la localidad de : <xsl:value-of select="$parametroExternoLocalidad"/></h1>
        
        
        <xsl:for-each-group select="//ROW" group-by="LOCALIDAD">
            <xsl:for-each select="current-group()[LOCALIDAD=$parametroExternoLocalidad]">
                <br/><xsl:value-of select="NOMBRE_LARGO"></xsl:value-of>
            </xsl:for-each>
        </xsl:for-each-group>
        
        
        
        
        
       


    </xsl:template>
</xsl:stylesheet>
