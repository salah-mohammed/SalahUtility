//
//  SwiftUIControls.swift
//  SalahUtility
//
//  Created by Salah on 6/2/22.
//  Copyright © 2022 Salah. All rights reserved.
//
#if os(iOS)
import Foundation
import SwiftUI
import UIKit
import WebKit
@available(iOS 13.0, *)
public struct ActivityIndicator: UIViewRepresentable {

    @Binding public var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    public init(style:UIActivityIndicatorView.Style,isAnimating:Binding<Bool>) {
        _isAnimating = isAnimating
        self.style = style
     }
    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
@available(iOS 13.0, *)
public struct Anything<Wrapper : UIView>: UIViewRepresentable {
    typealias Updater = (Wrapper, Context) -> Void

    var makeView: () -> Wrapper
    var update: (Wrapper, Context) -> Void

    public init(_ makeView: @escaping @autoclosure () -> Wrapper,
         updater update: @escaping (Wrapper) -> Void) {
        self.makeView = makeView
        self.update = { view, _ in update(view) }
    }

    public func makeUIView(context: Context) -> Wrapper {
        makeView()
    }

    public func updateUIView(_ view: Wrapper, context: Context) {
        update(view, context)
    }
}
@available(iOS 13.0, *)
public struct RotatingForeverView: View {
  @State private var isRotating = 0.0
  @State private var duration = 3.5

   var subView:()->AnyView
    
   public init(duration:Double = 3.5, subView: @escaping () -> AnyView) {
        self.duration = duration
        self.subView = subView
    }
    public var body: some View{
       subView().rotationEffect(.degrees(isRotating))
           .onAppear {
               withAnimation(.linear(duration:duration)
                       .repeatForever(autoreverses: false)) {
                   isRotating = 360.0
               }
           }
   }
}

@available(iOS 13.0, *)
public struct WebView: UIViewRepresentable {
    var url: URL
    @Binding public var finished:Bool?
    @Binding public var progressValue:Float

    public init(url: URL, finished:Binding<Bool?>, progressValue:Binding<Float>) {
        self.url = url
        _finished = finished
        _progressValue = progressValue
    }
    public func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView{
        let wkWebView = WKWebView();
        wkWebView.navigationDelegate = context.coordinator
        let request = URLRequest(url: url)
        wkWebView.load(request)
        return wkWebView
    }
    public func updateUIView(_ webView: WKWebView, context: Context) {

    }
    public func makeCoordinator() -> WebView.Coordinator {
        let coordinator = Coordinator(self);
       return coordinator
    }
    
    public class Coordinator: NSObject, WKNavigationDelegate{
        public var parent: WebView
        var observer:Any?
        init(_ parent: WebView){
            self.parent = parent
           
        }
        public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.parent.finished=false;
            observer = webView.observe(\.estimatedProgress, options: [.new]) { webView,_ in
                self.parent.progressValue = Float (webView.estimatedProgress)
            }
        }
        public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.parent.finished = true
        self.observer=nil;
        }
    }
}

#endif



