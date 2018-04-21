<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        <html>
            <style>
                b{display:table-cell;
                vertical-align:top;} 
                
                table{margin-left: auto;
                margin-right: auto; background-color: #e2cfe9; border-collapse: collapse; }
                table, th, td {
                border: 2px solid white;
                }
                
                
            </style>
            <head></head>
            <body><xsl:apply-templates select="//escrutinio_sitio/nombre_sitio"></xsl:apply-templates></body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="//escrutinio_sitio/nombre_sitio">
        
        <h2>Resultados de las Elecciones Municipales en :<xsl:for-each select="/municipales"> <xsl:value-of select="/municipales/escrutinio_sitio/nombre_sitio"/></xsl:for-each></h2>
        
        <p><b>Datos Generales</b></p>
        <p></p>
        <table>
            <tr>
                <th></th>
                <th>Votos</th>
                <th>Abstenciones</th>
                <th>Nulos</th>
                <th>Blancos</th>
            </tr>
            <td>Cantidad</td>
            <td><xsl:value-of select="/municipales/escrutinio_sitio/votos/contabilizados/cantidad"/></td>
            <td><xsl:value-of select="/municipales/escrutinio_sitio/votos/abstenciones/cantidad"/></td>
            <td><xsl:value-of select="/municipales/escrutinio_sitio/votos/nulos/cantidad"/></td>
            <td><xsl:value-of select="/municipales/escrutinio_sitio/votos/blancos/cantidad"/></td>
            <tr>
                <td>Porcentaje</td>
                <td><xsl:value-of select="/municipales/escrutinio_sitio/votos/contabilizados/porcentaje"/>%</td>
                <td><xsl:value-of select="/municipales/escrutinio_sitio/votos/abstenciones/porcentaje"/>%</td>           
                <td><xsl:value-of select="/municipales/escrutinio_sitio/votos/nulos/porcentaje"/>%</td>
                <td><xsl:value-of select="/municipales/escrutinio_sitio/votos/blancos/porcentaje"/>%</td>
            </tr>
            
        </table>
        
    </xsl:template>
</xsl:stylesheet>