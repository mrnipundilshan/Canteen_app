const UserModel = require('../model/user.model');

class UserService{
    static async register(mobile_number,name,faculty,address,password){
        try{
            const createUser = new UserModel({mobile_number,name,faculty,address,password});
            return await createUser.save();
        }catch(error){
            if(error.code === 11000){
                throw new Error('Mobile Number Already in use');
            }
            throw error;
        }
    }
}

module.exports = UserService;