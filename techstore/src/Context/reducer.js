export const initialState = {
    cart: []
};

const reducer = (state, action) => {
    switch (action.type) {
        case 'ADD_TO_CART':
            return {
                ...state,
                cart: [...state.cart, action.item],
            };

        case 'REMOVE_CART':
            const index = state.cart.findIndex(
                (cartItem) => cartItem.id === action.id
            );
            // newFavorites is the new array
            let newCart = [...state.cart];

            if (index >= 0) {
                newCart.splice(index, 1)
            } else {
                console.warn(
                    `Can't remove favote note (id: ${action.id}) as it's not in favorites list!`
                )
            }

            return {
                ...state,
                cart: newCart
            }

        default:
            return state;
    }
};
localStorage.setItem('cart', JSON.stringify(initialState.cart));


export default reducer;

