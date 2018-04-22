<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>municiplales</title>
                <link rel="stylesheet" href="estilo.css"/>
                
            </head>
        <table border="1">
            <xsl:apply-templates select="municipales/escrutinio_sitio"/>
            
        </table>
        
        </html>     
    </xsl:template>
    
    <xsl:template match="escrutinio_sitio">
        <tr><td><xsl:value-of select="nombre_sitio"/></td>
            <td><xsl:apply-templates select="resultados"/></td>
        </tr>
        
    </xsl:template>
    
    <xsl:template match="resultados">
     <table> 
            <tr> <th>Nombre Parido</th><th>nº de votos</th><th>% votos</th></tr>
            <xsl:apply-templates select="partido"/>
     </table>
         
    </xsl:template>
    <xsl:template match="partido">
    <tr>
        <td><xsl:value-of select="nombre"/></td>
        <td><xsl:value-of select="votos_numero"/></td>
        <td><xsl:value-of select="votos_porciento"/></td>
    </tr>
    </xsl:template>
</xsl:stylesheet>