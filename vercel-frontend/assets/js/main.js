const API_BASE = window.API_BASE || 'https://YOUR-PHP-HOST/api'; // replace with your PHP host API base
async function loadFeatured(){
  const el = document.getElementById('featured-products');
  if(!el) return;
  try{
    const res = await fetch(API_BASE + '/featured_products.php?limit=6');
    const json = await res.json();
    if(json.ok && json.data.length){
      el.innerHTML = json.data.map(p=>
        <article class="card">
          <div class="card-media"><img src="" alt=""></div>
          <div class="card-body">
            <h3></h3>
            <p class="price">K</p>
          </div>
        </article>).join('');
    } else { el.innerHTML='<p>No products</p>'; }
  }catch(e){ el.innerHTML='<p>Unable to load</p>'; }
}
function escapeHtml(s){const d=document.createElement('div');d.textContent=s;return d.innerHTML;}
document.addEventListener('DOMContentLoaded',loadFeatured);

