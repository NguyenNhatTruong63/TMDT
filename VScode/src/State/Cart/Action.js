import { api } from "../../config/apiConfig"
import {
    ADD_ITEM_TO_CART_FAILURE,
    ADD_ITEM_TO_CART_REQUEST,
    ADD_ITEM_TO_CART_SUCCESS,
    GET_CART_FAILURE,
    GET_CART_REQUEST,
    GET_CART_SUCCESS,
    REMOVE_CART_ITEM_FAILURE,
    REMOVE_CART_ITEM_REQUEST,
    REMOVE_CART_ITEM_SUCCESS,
    UPDATE_CART_ITEM_FAILURE,
    UPDATE_CART_ITEM_REQUEST,
    UPDATE_CART_ITEM_SUCCESS
} from "./ActionType"

export const getCart = () => async (dispatch) => {
    dispatch({ type: GET_CART_REQUEST })

    try {
        const { data } = await api.get(`/api/cart/`)
        dispatch({ type: GET_CART_SUCCESS, payload: data })
        console.log("cart ", data)
    } catch (error) {
        dispatch({ type: GET_CART_FAILURE, payload: error.message })
    }
}

export const addItemToCart = (reqdata) => async (dispatch) => {
    dispatch({ type: ADD_ITEM_TO_CART_REQUEST })
    
    try {
        const { data } = await api.put("/api/cart/add", reqdata)
        dispatch({ type: ADD_ITEM_TO_CART_SUCCESS, payload: data })
        console.log("add item to cart ", data)
    } catch (error) {
        dispatch({ type: ADD_ITEM_TO_CART_FAILURE, payload: error.message })
    }
}

export const removeCartItem = (cartItemID) => async (dispatch) => {
    console.log("Attempting to remove cart item with ID:", cartItemID);
    dispatch({ type: REMOVE_CART_ITEM_REQUEST })

    try {
        const { data } = await api.delete(`/api/cart_items/${cartItemID}`)
        dispatch({ type: REMOVE_CART_ITEM_SUCCESS, payload: cartItemID })
        console.log("Cart item removed successfully:", data);
    } catch (error) {
        console.error("Error removing cart item:", error);
        dispatch({ type: REMOVE_CART_ITEM_FAILURE, payload: error.message })
    }
}

export const updateCartItem = (reqdata) => async (dispatch) => {
    dispatch({ type: UPDATE_CART_ITEM_REQUEST })

    try {
        const { data } = await api.put(`/api/cart_items/${reqdata.cartItemId}`, reqdata.data)
        dispatch({ type: UPDATE_CART_ITEM_SUCCESS, payload: data })
        
    } catch (error) {
        console.error("Error updating cart item: ", error);
        dispatch({ type: UPDATE_CART_ITEM_FAILURE, payload: error.message })
    }
};