sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"autoreslistview/test/integration/pages/AutoresList.gen",
	"autoreslistview/test/integration/pages/AutoresObjectPage.gen"
], function (JourneyRunner, AutoresListGenerated, AutoresObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('autoreslistview') + '/test/flp.html#app-preview',
        pages: {
			onTheAutoresListGenerated: AutoresListGenerated,
			onTheAutoresObjectPageGenerated: AutoresObjectPageGenerated
        },
        async: true
    });

    return runner;
});

