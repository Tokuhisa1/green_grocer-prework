# def consolidate_cart(cart)
#   # code here
#   consolidated = {}
#   cart.each do |item|
#     item.each do |key, value|
#       if !consolidated.key?(key)
#         consolidated[key] = value
#         consolidated[key][:count] = 1
#       else
#         consolidated[key][:count] = consolidated[key][:count] + 1
#       end
#     end
#   end
#   consolidated
# end

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
