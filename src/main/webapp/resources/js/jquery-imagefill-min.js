!function(t){
	t.fn.imagefill=function(i){
		function e(){
			s=0,r=0,o.each(function(){
				n=t(this).find(u.target).width()/t(this).find(u.target).height();
				var i=t(this).outerWidth(),e=t(this).outerHeight();
				s+=t(this).outerHeight(),r+=t(this).outerWidth();
				var h=i/e;n>h?t(this)
							.find(u.target)
							.css({width:"auto",height:e,top:0,left:-(e*n-i)/2}):t(this)
														.find(u.target).css({width:i,height:"auto",top:-(i/n-e)/2,left:0})
				})
		}
		function h(){
			var i=0,n=0;o.each(function(){
				n+=t(this).outerHeight(),i+=t(this).outerWidth()
			}),
			(s!==n||r!==i)&&e(),setTimeout(h,u.throttle)
		}
		var o=this,n=1,s=0,r=0,a={runOnce:!1,target:"img",throttle:200},u=t.extend({},a,i),
		d=o.find(u.target).addClass("loading").css({position:"absolute"}),c=o.css("position");
	return o.css({overflow:"hidden",position:"static"===c?"relative":c}),
		o.each(function(){
			s+=t(this).outerHeight(),r+=t(this).outerWidth()
		}),
		o.imagesLoaded().done(function(t){
				n=d.width()/d.height(),d.removeClass("loading"),e(),u.runOnce||h()
		}),this
	}
}(jQuery);