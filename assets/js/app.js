$(function(){
 const $nav=$('.main-nav'); $('.menu-toggle').on('click',()=> $nav.toggleClass('open'));
 $('.metric-card').on('click',function(){ $(this).toggleClass('flipped') });
 let slides=$('.hero-slide'), i=0; if(slides.length){ setInterval(()=>{slides.eq(i).removeClass('active');i=(i+1)%slides.length;slides.eq(i).addClass('active')},4200)}
 const words=['Leadership','Education','Empowerment','Visibility','Control','Growth']; let wi=0; const $rw=$('.rotating-word').addClass('type-caret'); if($rw.length){ let pos=0,deleting=false; const tick=()=>{ const w=words[wi]; $rw.text(w.slice(0,pos)); if(!deleting){ if(pos<w.length){pos++;setTimeout(tick,85)} else {deleting=true;setTimeout(tick,1500)} } else { if(pos>0){pos--;setTimeout(tick,45)} else {deleting=false;wi=(wi+1)%words.length;setTimeout(tick,320)} } }; tick(); }
 $(document).on('mousemove',e=>{ $('.cursor-dot').css({transform:`translate(${e.clientX-3}px,${e.clientY-3}px)`}); $('.cursor-ring').css({transform:`translate(${e.clientX-14}px,${e.clientY-14}px)`}) });
 $(document).on('mouseenter','a,button,.glass-card,img',()=>$('.cursor-ring').css({width:42,height:42})).on('mouseleave','a,button,.glass-card,img',()=>$('.cursor-ring').css({width:28,height:28}));
 function toast(msg,ok=true){Toastify({text:msg,duration:3500,gravity:'top',position:'right',close:true,style:{background:ok?'linear-gradient(135deg,#2448ff,#1ab7bd)':'linear-gradient(135deg,#d43d67,#ff7b62)',borderRadius:'12px',boxShadow:'0 15px 40px rgba(0,0,0,.3)'}}).showToast()}
 function errorField($el,msg){$el.addClass('invalid');$el.next('.field-error').remove();$el.after(`<div class="field-error">${msg}</div>`)} function clearErrors($f){$f.find('.field-error').remove();$f.find('.invalid').removeClass('invalid')}
 window.validateForm=function($f){clearErrors($f);let ok=true;$f.find('[data-required]').each(function(){let $x=$(this),v=$.trim($x.val());if(!v){errorField($x,$x.data('message')||'This information is required.');ok=false}else if($x.attr('type')==='email'&&!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v)){errorField($x,'Enter a valid email address.');ok=false}});return ok}
 $('form.ajax-form').on('submit',function(e){e.preventDefault();let $f=$(this);if(!validateForm($f)) return;let $b=$f.find('button[type=submit]').addClass('loading');let fd=new FormData(this);$.ajax({url:$f.attr('action'),method:'POST',data:fd,processData:false,contentType:false,dataType:'json'}).done(r=>{toast(r.message,r.ok);if(r.ok){$f[0].reset();if(r.data&&r.data.redirect){setTimeout(()=>location.href=r.data.redirect,450)}else if($f.data('reload')) setTimeout(()=>location.reload(),650)}}).fail(x=>toast(x.responseJSON?.message||'Request failed. Please try again.',false)).always(()=> $b.removeClass('loading'))});
 $('#newsletterForm').on('submit',function(e){e.preventDefault();let $f=$(this),name=$.trim($f.find('[name=name]').val()),email=$.trim($f.find('[name=email]').val());clearErrors($f);let ok=true;if(name.length<2){errorField($f.find('[name=name]'),'Enter your name.');ok=false}if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)){errorField($f.find('[name=email]'),'Enter a valid email address.');ok=false}if(!ok)return;let $b=$f.find('button').addClass('loading');$.post('api/newsletter.php',{name,email}).done(r=>{toast(r.message,r.ok);if(r.ok)$f[0].reset()}).fail(()=>toast('Subscription could not be completed.',false)).always(()=>$b.removeClass('loading'))});
 $(document).on('click','[data-delete-url]',function(){let url=$(this).data('delete-url');Swal.fire({title:'Delete this item?',text:'This action cannot be undone.',icon:'warning',showCancelButton:true,confirmButtonText:'Yes, delete it',confirmButtonColor:'#e64972',background:'#0c1a2c',color:'#fff'}).then(r=>{if(r.isConfirmed)$.post(url,{csrf:window.csrfToken||''}).done(x=>{toast(x.message,x.ok);if(x.ok)setTimeout(()=>location.reload(),500)}).fail(()=>toast('Delete failed.',false))})});
});

let sr=$('.support-rotator img'),si=0;if(sr.length){sr.eq(0).addClass('active');setInterval(()=>{sr.eq(si).removeClass('active');si=(si+1)%sr.length;sr.eq(si).addClass('active')},3200)}

/* ===== V5 interactions: reveals, counters, page transitions ===== */
(function(){
  if(!document.querySelector('.site-header')) return;
  const reduce=window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  if('IntersectionObserver' in window && !reduce){
    const io=new IntersectionObserver((entries)=>{
      entries.forEach(en=>{ if(en.isIntersecting){ en.target.classList.add('in'); io.unobserve(en.target);} });
    },{threshold:.12,rootMargin:'0px 0px -40px 0px'});

    const targets=document.querySelectorAll(
      '.page-hero .container,.section-head,.card-grid,.split,.metrics,.catalog-toolbar,'+
      '.gallery-grid,.product-public-grid,.cta-banner,.download-band,.auth-card,.content-shell>.container>.form-card,'+
      '.hero-grid>div:first-child'
    );
    targets.forEach((el,idx)=>{
      if(el.closest('.hero-visual')) return;
      el.classList.add('reveal');
      const group=[...el.parentElement.children].filter(c=>c.classList.contains('reveal'));
      const i=group.indexOf(el);
      if(i>0) el.style.transitionDelay=Math.min(i*90,360)+'ms';
      io.observe(el);
    });
  }

  if('IntersectionObserver' in window && !reduce){
    const cio=new IntersectionObserver((entries)=>{
      entries.forEach(en=>{
        if(!en.isIntersecting) return;
        const el=en.target, raw=el.textContent.trim();
        const prefix=raw.startsWith('$')?'$':'', suffix=raw.endsWith('%')?'%':'';
        const num=parseFloat(raw.replace(/[^0-9.]/g,''));
        if(!num){cio.unobserve(el);return}
        const dur=1100, start=performance.now();
        const step=t=>{
          const p=Math.min((t-start)/dur,1), ease=1-Math.pow(1-p,3);
          const val=Math.round(num*ease);
          el.textContent=prefix+val.toLocaleString('en-US')+suffix;
          if(p<1) requestAnimationFrame(step);
        };
        requestAnimationFrame(step);
        cio.unobserve(el);
      });
    },{threshold:.6});
    document.querySelectorAll('.metric-face strong').forEach(el=>cio.observe(el));
  }

  document.addEventListener('click',function(e){
    const a=e.target.closest('a[href]');
    if(!a) return;
    const href=a.getAttribute('href');
    if(!href||a.target==='_blank'||a.hasAttribute('download')) return;
    if(href.startsWith('#')||href.startsWith('http')||href.startsWith('mailto:')||href.startsWith('tel:')||href.startsWith('javascript:')) return;
    if(reduce) return;
    e.preventDefault();
    document.body.classList.add('page-leaving');
    setTimeout(()=>{location.href=href},270);
  });
  window.addEventListener('pageshow',()=>document.body.classList.remove('page-leaving'));
})();

