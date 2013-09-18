/**
 * @author Stéphane Roucheray 
 * @extends jquery
 */


jQuery.fn.carousel = function(previous, next, options){
	var sliderList = jQuery(this).children()[0];
	
	if (sliderList) {
		var increment = jQuery(jQuery(sliderList).children()).outerWidth(),
		elmnts = jQuery(sliderList).children(),
		numElmts = elmnts.length,
		sizeFirstElmnt = increment,
		shownInViewport = Math.round(jQuery(this).width() / sizeFirstElmnt),
		firstElementOnViewPort = 1,
		isAnimating = false;
		
		jQuery(sliderList).css('left', -increment); 
		jQuery(sliderList).css('margin-left', increment/3); 
		for (i = 0; i < shownInViewport; i++) {
			jQuery(sliderList).css('width',(numElmts+shownInViewport)*increment + increment + "px");
			jQuery(sliderList).append(jQuery(elmnts[i]).clone());
		}

		$($(sliderList).children()[firstElementOnViewPort]).css('opacity', '1');
		jQuery(previous).click(function(event){
			if (!isAnimating) {
				$($(sliderList).children()[firstElementOnViewPort]).css('opacity', '.7');
				if (firstElementOnViewPort == 1) {
					jQuery(sliderList).css('left', "-" + numElmts * sizeFirstElmnt + "px");
					firstElementOnViewPort = numElmts;
					$(previous).hide()
				}
				else {
					firstElementOnViewPort--;
				}
				$($(sliderList).children()[firstElementOnViewPort]).css('opacity', '1');
				
				jQuery(sliderList).animate({
					left: "+=" + increment,
					y: 0,
					queue: true
				}, "slow", function(){isAnimating = false;});
				isAnimating = true;
			}
			
		});
		
		jQuery(next).click(function(event){
			if (!isAnimating) {
				$($(sliderList).children()[firstElementOnViewPort]).css('opacity', '.7');
				if (firstElementOnViewPort > numElmts) {
					firstElementOnViewPort = 2;
					jQuery(sliderList).css('left', "0px");
				}
				else {
					firstElementOnViewPort++;
				}
				$($(sliderList).children()[firstElementOnViewPort]).css('opacity', '1');
				jQuery(sliderList).animate({
					left: "-=" + increment,
					y: 0,
					queue: true
				}, "slow", function(){isAnimating = false;});
				isAnimating = true;
			}
		});
	}
};
