// ==UserScript==
// @name         Wowhead Item ID Fetcher
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Fetches item IDs from the Wowhead dressing room
// @author       You
// @match        https://www.wowhead.com/wotlk/dressing-room
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Create the button
    var button = document.createElement('button');
    button.innerText = 'Get Item IDs';

    // Add the event listener
    button.addEventListener('click', () => {
        var htmlContent = document.body.innerHTML;
        var regex = /<div class="iconlarge".*?data-game="wow" data-character-slot="(\d+)".*?(?:item=(\d+)|rel="undefined").*?<\/div>/g;
        var slots = {};

        var match;
        while ((match = regex.exec(htmlContent)) !== null) {
            var slot = match[1];
            var itemId = match[2] || 0;
            slots[slot] = itemId;
        }

        var output = Object.entries(slots)
        .map(([slot, itemId]) => `[${slot}] = ${itemId},`)
        .join('\n');

        alert(output);
    });

    // Append the button to the desired div
    var parentDiv = document.querySelector('.dressing-room-character-controls-general');
    parentDiv.appendChild(button);

})();
