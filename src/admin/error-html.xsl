<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output
    method="html"
    doctype-system="about:legacy-compat"
    encoding="utf-8"
  />
  <xsl:template match="/node()">
    <html>
      <head>
        <meta charset="utf-8" />
        <title>Error</title>
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=yes"
        />
      </head>
      <body>
        <main role="main">
          <h2>Error</h2>
          <xsl:for-each select="/report/incident">
            <section class="box">
              <h3 class="box_title">Response</h3>
              <h4>Message</h4>
              <p>
                <xsl:value-of select="state/text" />
              </p>
              <xsl:if test="state/@definition">
                <p>
                  Error code:
                  <xsl:value-of select="state/@definition" />
                </p>
              </xsl:if>
            </section>
          </xsl:for-each>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
