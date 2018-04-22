<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        <html>
            <head> 
                <link rel="stylesheet" href="estilo.css"/>
                <style>
                p{display:table-cell;
                vertical-align:top;} 
                
                table{margin-left: auto;
                margin-right: auto; background-color: #e2cfe9; }
                
                
            </style>
            </head>  
            <body><xsl:apply-templates select="municipales/escrutinio_sitio"></xsl:apply-templates></body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="escrutinio_sitio">
        
     <h2>      Resultados de las Elecciones Municipales en :<xsl:value-of select="nombre_sitio"/>   </h2>     
      
        <p></p>
        <table border="1">
            <caption>Datos Generales</caption>
            <tr>
                <th></th>
                <th>Votos</th>
                <th>Abstenciones</th>
                <th>Nulos</th>
                <th>Blancos</th>
            </tr>
            <td>Cantidad</td>
            <td><xsl:value-of select="votos/contabilizados/cantidad"/></td>
            <td><xsl:value-of select="votos/abstenciones/cantidad"/></td>
            <td><xsl:value-of select="votos/nulos/cantidad"/></td>
            <td><xsl:value-of select="votos/blancos/cantidad"/></td>
            <tr>
                <td>Porcentaje</td>
                <td><xsl:value-of select="votos/contabilizados/porcentaje"/></td>
                <td><xsl:value-of select="votos/abstenciones/porcentaje"/></td>           
                <td><xsl:value-of select="votos/nulos/porcentaje"/></td>
                <td><xsl:value-of select="votos/blancos/porcentaje"/></td>
            </tr>
            
        </table>
       
    </xsl:template>
</xsl:stylesheet>