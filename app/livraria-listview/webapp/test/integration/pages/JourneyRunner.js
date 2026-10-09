sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"livrarialistview/test/integration/pages/LivrosList.gen",
	"livrarialistview/test/integration/pages/LivrosObjectPage.gen"
], function (JourneyRunner, LivrosListGenerated, LivrosObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('livrarialistview') + '/test/flpSandbox.html#livrarialistview-tile',
        pages: {
			onTheLivrosListGenerated: LivrosListGenerated,
			onTheLivrosObjectPageGenerated: LivrosObjectPageGenerated
        },
        async: true
    });

    return runner;
});

