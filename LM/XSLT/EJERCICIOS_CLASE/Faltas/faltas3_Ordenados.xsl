<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        
        <ul>
         <xsl:for-each select="//ALUMNO">
             <xsl:sort select="T_APELLIDO1"/>
             <xsl:variable name="nombreCompleto" select="concat(T_APELLIDO1,' , ', T_NOMBRE_ALU)"/>
             <xsl:if test="FALTAS_ASISTENCIA/FALTA_ASISTENCIA">
                 
                 <li> <xsl:value-of select="$nombreCompleto"/> </li>
             </xsl:if>
         </xsl:for-each>
            
            
        </ul>
        
        
    </xsl:template>

    
    
    
</xsl:stylesheet>