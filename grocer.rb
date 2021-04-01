# def apply_coupons(cart, coupons)
#   # code here
#   applied = {}

#   applied = Marshal.load(Marshal.dump(cart))
#   applied.each do |key, value|
#     if key == coupons[0][:item]
#       applied[key][:count] = applied[key][:count] - coupons[0][:num]
#     end
#   end
#       applied[coupons[0][:item] + ' W/COUPON'] = {:price =>
#         coupons[0][:cost], :clearance => true, :count => 1}

#   applied
# end

# def apply_clearance(cart)
#   # code here
# end

# def checkout(cart, coupons)
#   # code here
# end

def consolidate_cart(cart)
  # code here
  new_cart = {}
  
  cart.each do | item |
    item.each do | name, values |
      if new_cart[name]
        new_cart[name][:count] = new_cart[name][:count] + 1
      else
        new_cart[name]         = values
        new_cart[name][:count] = 1
      end
    end
  end
  
  new_cart
end

def apply_coupons(cart, coupons)
  # code here
  coupons.each do | coupon |
    item = coupon[:item]
  
    if !cart[item]
      next
    end
    
    if cart[item][:count] >= coupon[:num]
      cart[item][:count] -= coupon[:num]
      
      if cart["#{item} W/COUPON"]
        cart["#{item} W/COUPON"][:count] += coupon[:num]
      else
        cart["#{item} W/COUPON"] = {
          :price => coupon[:cost] / coupon[:num],
          :clearance => cart[item][:clearance],
          :count => coupon[:num]
        }
      end
    end
  end
  
  cart
end

def apply_clearance(cart)
  # code here
  cart.each do | item, props |
    if props[:clearance]
      props[:price] = props[:price] * 80 / 100
    end
  end
end

def checkout(cart, coupons)
  # code here
  sum = 0
  cart = consolidate_cart(cart)
  cart = apply_clearance(apply_coupons(cart, coupons))

  cart.each do | item, props |
    sum = sum + props[:price] * props[:count]
  end
  
  if sum > 100
    sum = sum * 90 / 100
  end

  sum
end
