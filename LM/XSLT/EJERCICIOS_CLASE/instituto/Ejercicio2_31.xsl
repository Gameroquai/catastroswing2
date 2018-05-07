<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <h1><xsl:value-of select="//@nombre"/></h1>
           <xsl:apply-templates select="ies" />
        <table border="1">
        <caption>Ciclos del ies:<xsl:value-of select="ies/@nombre"/></caption>
            <xsl:apply-templates select="//ciclos"></xsl:apply-templates>
           
        </table>
    </xsl:template>
    
 <xsl:template match="ies">
   <p>Pagina web:
    <a>
       <xsl:attribute name="href" ><xsl:value-of select="@web"/></xsl:attribute>   
        <xsl:value-of select="@web"/>      
   </a>
   </p>
 </xsl:template>
  <xsl:template match="ciclos">
     
      <tr><th> Ciclo</th><th>Grado</th><th>Año Decreto</th></tr>
      <xsl:apply-templates select="ciclo"/>
  </xsl:template>  

    <xsl:template match="ciclo">
        <tr>
        <td><xsl:value-of select="nombre"/></td>
        <td><xsl:value-of select="grado"/></td>
        <td> <xsl:value-of select="decretoTitulo/@año"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>