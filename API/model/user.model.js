const mongoose = require('mongoose');
const db = require('../config/db');
const bcrypt = require('bcrypt');

const { Schema } = mongoose;

const userSchema = new Schema({
    mobile_number:{
        type:String,
        required : true,
        unique : true,
    },
    name:{
        type:String,
        required : true,
    },

    faculty:{
        type:String,
        required : true,
    },

    address:{
        type:String,
        required : true,
    },

    password:{
        type:String,
        required : true,
    },


});

const orderSchema = new Schema({
    mobile_number:{
        type:String,
        required : true,
        unique : true,
    },
    total:{
        type:int,
        required: false,
    },

    veg_count:{
        type:int,
        required: false,
    },

    veg_price:{
        type:int,
        required: false,
    },

    egg_count:{
        type:int,
        required: false,
    },
    egg_price:{
        type:int,
        required: false,
    },

    chicken_count:{
        type:int,
        required: false,
    },

    chicken_price:{
        type:int,
        required: false,
    },

    rice_count:{
        type:int,
        required: false,
    },

    rice_price:{
        type:int,
        required: false,
    },

    kottu_count:{
        type:int,
        required: false,
    },

    kottu_price:{
        type:int,
        required: false,
    },

    fish_count:{
        type:int,
        required: false,
    },

    fish_price:{
        type:int,
        required: false,
    },


});



userSchema.pre('save', async function(){
    try{
        var user = this;
        const salt = await(bcrypt.genSalt(10));
        const hashpass = await bcrypt.hash(user.password,salt);

        user.password = hashpass;
    }catch(error){
        throw error
    }
});

userSchema.methods.comparePassword = async function(userPassword){
    try{
        const isMatch = await bcrypt.compare(userPassword, this.password);
        return isMatch;
    } catch(error) {
        throw error
    }
}

const UserModel = db.model('user', userSchema);

module.exports = UserModel;