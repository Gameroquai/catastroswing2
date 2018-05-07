<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">           
        <html>
            <head>
                        <meta charset="UTF-8"/>
                        <link href="estilo.css" rel="stylesheet" type="text/css"/>
            </head>
        <body>
            
            <xsl:variable name="totalAlum" select="count(//ALUMNO)"/>
            
            <xsl:value-of select="$totalAlum"/>
            
            <xsl:value-of select="count(//FALTA_ASISTENCIA)"/>
            
          <xsl:variable name="media" select="count(//FALTA_ASISTENCIA) div $totalAlum"/>
            
            <xsl:value-of select="$media"/>
            
            
            
            
            
        </body>
        
        </html>  
    </xsl:template>
    
    
    
    
</xsl:stylesheet>