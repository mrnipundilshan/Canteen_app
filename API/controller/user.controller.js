const UserModel = require("../model/user.model");
const UserService = require("../services/user.services");
const db = require('../config/db');

exports.register = async(req,res,next)=>{
    try{
        
        const {mobile_number,name,faculty,address,password} = req.body;
        
        if (!mobile_number || !name || !faculty || !address || !password) {
            return res.status(400).send({ error: 'All fields are required' });
        }

        const successRes = await UserService.register(mobile_number,name,faculty,address,password);

        res.json({status:true, success:"User Registered Successfully"});
        
    }catch(error){
        if(error.message === "Mobile Number Already in use"){
            res.status(400).json({status: false, error: error.message});
        }else{
            throw(error);
        }
    }
}

exports.login = async(req,res,next)=>{
    try {
        const {mobile_number,password} = req.body;

        const user = await UserService.checkuser(mobile_number);

        if(!user){
            return res.status(400).json({status:false, error: 'User does not exist'});
        }

        const isMatch = await user.comparePassword(password);

        if(isMatch === false){
            return res.status(400).json({status: false, error:"Password Invalid"});
        }

        let tokenData = {_id:user._id, mobile_number:user.mobile_number};

        const token = await UserService.genarateToken(tokenData,"secretKey",'1h');

        res.json({status:true, token:token});
    } catch(error){
        next(error);
    }
}

exports.getmenu = async (req,res)=>{
    try{
        const collection = db.collection('menu');
        const menu = await collection.find({}).toArray();
        res.status(200).json(menu);
    } catch(error){
        res.status(500).json({message: 'Error fetching menu details', error: error});
    }
};
