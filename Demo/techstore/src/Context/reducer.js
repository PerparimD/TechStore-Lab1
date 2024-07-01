let cart = [];
if (localStorage.getItem('cart')) {
    cart = JSON.parse(localStorage.getItem('cart'));
}

export const initialState = {
    cart: cart
};

const reducer = (state, action) => {
    switch (action.type) {
        case 'ADD_TO_CART':
            localStorage.setItem("shfaqMesazhinPasRef", false)
            const produktiPerTuShtuar = action.item;
            const produktiEkzitues = state.cart.find(item => item.id === produktiPerTuShtuar.id);
            let shporta;

            if (produktiEkzitues) {
                shporta = state.cart.map(item => {
                    if (item.id === produktiEkzitues.id) {
                        return {
                            ...item,
                            sasia: item.sasia + produktiPerTuShtuar.sasia
                        };
                    }
                    return item;
                });
            } else {
                shporta = [...state.cart, produktiPerTuShtuar];
            }

            localStorage.setItem('cart', JSON.stringify(shporta));
            return { ...state, cart: shporta };

        case 'REMOVE_CART':
            const largoNgaShporta = state.cart.filter((item) => item.id !== action.id);
            localStorage.setItem('cart', JSON.stringify(largoNgaShporta));
            return { ...state, cart: largoNgaShporta };

        case 'NDRYSHO_SASISNE':
            const produktiPerditesuar = state.cart.map(item => {
                if (item.id === action.id) {
                    return { ...item, sasia: action.sasia };
                } else {
                    return item;
                }
            });
            localStorage.setItem('cart', JSON.stringify(produktiPerditesuar));
            return { ...state, cart: produktiPerditesuar };
        default:
            return state;
    }
};


export default reducer;
