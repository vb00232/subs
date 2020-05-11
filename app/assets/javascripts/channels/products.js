App.products = App.cable.subscriptions.create('ProductsChannel', {
  received: function(data) {
    if ($('.noitemsfound'+data.category.toLowerCase().replace(/\s/g,'')).length > 0) {
      $('.noitemsfound'+data.category.toLowerCase().replace(/\s/g,'')).css("display", "none");
    }
    return $('.track'+data.category.toLowerCase().replace(/\s/g,'')).prepend(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return(
      '<div class="item-container"><div class="item"><div class="img"><a href="/products/' +
      data.prodid + '"><img class="productImage" src="' + data.prodimage +
      '"></a></div><div class="info"><p>' + data.prodname + '</p>' +
      '<p>£' + data.prodprice + '0</p></div></div></div>'
    );
  }
});
