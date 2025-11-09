<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
        <head>
            <title>Recipes</title>
            <link rel="stylesheet" type="text/css" href="style.css"/> 
        </head>
        <body>
            <h1>Recipes</h1>
            
            <input type="text" id="recipe-search" placeholder="Search recipes by name..." onkeyup="filterRecipes()"/>
            
            <div class="recipe-grid">
                
                <xsl:for-each select="recipes/recipe">
                    <xsl:sort select="name" data-type="text" order="ascending"/>
                    
                    <a class="recipe-card" href="{link}">
                        <img src="{image}" alt="Image of {name}"/> 
                        <h3><xsl:value-of select="name"/></h3>
                    </a>
                </xsl:for-each>
                
            </div>
            
            <script>
            // FIX 4: Wrap JavaScript in CDATA section
            <![CDATA[ 
                function filterRecipes() {
                    let input = document.getElementById('recipe-search').value.toLowerCase();
                    let cards = document.getElementsByClassName('recipe-card');
                    
                    for (let i = 0; i < cards.length; i++) {
                        // The text we check is the content of the card's <h3> (the recipe name)
                        let text = cards[i].getElementsByTagName('h3')[0].textContent.toLowerCase();
                        
                        if (text.indexOf(input) > -1) {
                            cards[i].style.display = ""; // Show the card
                        } else {
                            cards[i].style.display = "none"; // Hide the card
                        }
                    }
                }
            ]]>
            </script>
            
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>