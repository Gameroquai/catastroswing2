<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <table border="1">
            <xsl:apply-templates select="municipales/escrutinio_sitio"/>
            
        </table>
        
        
    </xsl:template>
    
    <xsl:template match="escrutinio_sitio">
        <tr><td><xsl:value-of select="nombre_sitio"/></td>
            <td><xsl:apply-templates select="resultados"/></td>
        </tr>
        
    </xsl:template>
    
    <xsl:template match="resultados">
        <xsl:value-of select="partido"/> <br/>
    </xsl:template>
    
    
</xsl:stylesheet>