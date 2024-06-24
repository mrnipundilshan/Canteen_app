const mongoose = require('mongoose');
const db = require('../config/db');

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


})

userSchema.pre('save', async function(){
    try{
        var user = this;
    }catch(error){
        throw error
    }
})

const UserModel = db.model('user', userSchema);

module.exports = UserModel;