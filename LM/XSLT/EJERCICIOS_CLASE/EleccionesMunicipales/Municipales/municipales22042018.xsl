<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
   <xsl:template match="/">
      
       <html lang="es">
          
            <head>
                <link rel="stylesheet" href="CSSmunicipales22042018.css"/>
                <title>Elecciones municipales</title>
            </head>
           
            <body> 
                <xsl:apply-templates select="/municipales/escrutinio_sitio"></xsl:apply-templates>
            </body>
           
       </html>
   </xsl:template>
    <xsl:template match="escrutinio_sitio">
        <h1>Resultados de las Elecciones Municipales en : <xsl:value-of select="nombre_sitio"/> </h1>
        <table border="1">
            
            <b><caption>Datos Generales</caption></b>
            
            <tr>
                <th/>
                <th>Votos</th>
                <th>Abtenciones</th>
                <th>Nulos</th>
                <th>Blancos</th>
            </tr>
            <tr>
                <td id="cant">Cantidad</td>
                <td><xsl:value-of select="votos/contabilizados/cantidad"/></td>
                <td><xsl:value-of select="votos/abstenciones/cantidad"/></td>
                <td><xsl:value-of select="votos/nulos/cantidad"/></td>
                <td><xsl:value-of select="votos/blancos/cantidad"/></td>
            </tr>
            <tr>
                <td id="cant">Porcentaje</td>
                <td><xsl:value-of select="votos/contabilizados/porcentaje"/></td>
                <td><xsl:value-of select="votos/abstenciones/porcentaje"/></td>
                <td><xsl:value-of select="votos/nulos/porcentaje"/></td>
                <td><xsl:value-of select="votos/blancos/porcentaje"/></td>
                
                
            </tr>
        </table>
        
    </xsl:template>
</xsl:stylesheet>