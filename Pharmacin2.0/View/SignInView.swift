//
//  SignInView.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 21/02/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var isSecured: Bool = true
    @State private var password: String = ""
    
    @State private var isLoggedInKaryawan = false
    @State private var isLoggedInAsistenDokter = false
    @State private var isEmailEmpty: Bool = false
    @State private var isPasswordEmpty: Bool = false
    
    @State private var showFailedToast = false
    @State private var showSuccessToast = false
    
    @State private var failedToastMessage = ""
    @State private var isLoading = false
    
    var onLogin: (Int) -> Void
    //    @Binding var roleID: Int?
    @EnvironmentObject var viewModel: SignInViewModel
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("SignInBackground")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack{
                    
                    
                    Image("PharmacinLogoWhite")
                        .padding(.bottom,14)
                    Image("PharmacinText")
                        .padding(.bottom,26)
                    
                    VStack{
                        Text("Masuk")
                            .font(Font.custom("PlusJakartaSans-Bold", size: 24))
                            .foregroundColor(Color(red: 0.47, green: 0.47, blue: 0.47))
                            .padding(.bottom,8)
                        Text("Selamat datang, silahkan masuk dengan\n akun yang telah terdaftar")
                            .font(Font.custom("PlusJakartaSans-Regular", size: 14))
                            .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                            .lineLimit(2)
                            .frame(height:36)
                            .multilineTextAlignment(.center)
                        
                            .padding(.bottom,70)
                        
                        TextField("Email", text: $email)
                            .padding()
                            .frame(width: 320, height: 38)
                        
                            .autocapitalization(.none)
                            .font(.custom("PlusJakartaSans-Medium", size: 14))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(isEmailEmpty ? .red : UIColor(red: 0.93, green: 0.93, blue: 0.96, alpha: 1)))
                            )
                        
                        
                        if isEmailEmpty{
                            Text("Email harus diisi!")
                                .font(.custom("PlusJakartaSans-Regular", size: 14))
                                .foregroundColor(Color("Red"))
                                .padding(.bottom,-24)
                                .padding(.trailing,185)
                        }
                        
                        HStack{
                            if isSecured {
                                SecureField("Password", text: $password)
                                    .padding()
                                    .autocapitalization(.none)
                                    .font(.custom("PlusJakartaSans-Medium", size: 14))
                                
                            } else {
                                TextField("Password", text: $password)
                                    .padding()
                                    .font(.custom("PlusJakartaSans-Medium", size: 14))
                                
                            }
                            
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(isSecured ? "EyeClose" : "EyeOpen")
                                    .padding(.trailing,8)
                                
                            }
                            
                            
                        }
                        
                        .frame(width: 320, height: 38)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(isPasswordEmpty ? .red : UIColor(red: 0.93, green: 0.93, blue: 0.96, alpha: 1)))
                        )
                        .padding(.top,24)
                        
                        
                        if isPasswordEmpty{
                            Text("Password harus diisi!")
                                .font(.custom("PlusJakartaSans-Regular", size: 14))
                                .foregroundColor(Color("Red"))
                                .padding(.bottom,-80)
                                .padding(.trailing,155)
                        }
                        
                        
                        
                        Button {
                            signIn()
                        } label: {
                            ActionButton(title: "Masuk", width: 264, height: 44, radius: 10, bgColor: "Green")
                                .padding(.top,80)
                        }
                        
                        
                        Spacer()
                    }
                    .padding(.top,42)
                    .frame(width: 484, height: 478)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 20, x: 2, y: 2
                    )
                    
                    Spacer()
                }.padding()
                
                if showFailedToast{
                    FailedToast(message: failedToastMessage)
                }
                
            }
            .loadingView(isLoading: $isLoading)
            
            
        }
        
        
    }
    
    
    
    private func signIn() {
        isPasswordEmpty = false
        isEmailEmpty = false
        
        guard !(email.isEmpty && password.isEmpty) else {
            isEmailEmpty = true
            isPasswordEmpty = true
            return
        }
        
        guard !email.isEmpty else {
            isEmailEmpty = true
            return
        }
        
        guard !password.isEmpty else {
            isPasswordEmpty = true
            return
        }
        
        isLoading = true
        
        viewModel.getData(email: email, password: password) {
            message, success  in
            if success {
                onLogin(UserDefaultService.shared.getId() ?? 0)
                
            } else {
                failedToastMessage = viewModel.errorMessage ?? "Unknown error"
                showFailedToast = true
                
                print(failedToastMessage)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showFailedToast = false
                    }
                }
            }
            isLoading = false
        }
    }
    
}



//struct LoginView_Preview: PreviewProvider {
//    static var previews: some View {
//        LoginView(roleID: <#Binding<Int?>#>)
//        LoginView().previewInterfaceOrientation(.landscapeRight)
//
//    }
//}
