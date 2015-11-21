//
//  IntroViewController.swift
//  hackday-ios-yammer-intro
//
//  Created by mmuno on 11/20/15.
//  Copyright © 2015 mamuso. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    
    // y-spittle
    @IBOutlet weak var logoY: UIImageView!
    @IBOutlet weak var logoSP0: UIImageView!
    @IBOutlet weak var logoSP1: UIImageView!
    @IBOutlet weak var logoSP2: UIImageView!
    
    // actions view
    @IBOutlet weak var actionsView: UIView!
    
    // animation view
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var cloud01: UIImageView!
    @IBOutlet weak var cloud02: UIImageView!
    @IBOutlet weak var clockView: UIImageView!
    @IBOutlet weak var computerView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var conv01: UIImageView!
    @IBOutlet weak var conv02: UIImageView!
    @IBOutlet weak var conv03: UIImageView!
    @IBOutlet weak var conv04: UIImageView!
    @IBOutlet weak var conv05: UIImageView!
    @IBOutlet weak var conv06: UIImageView!
    @IBOutlet weak var conv07: UIImageView!
    
    
    // text area
    @IBOutlet weak var textView: UIView!
    
    
    // vars
    var actionsViewCenter:CGPoint!
    var textViewCenter:CGPoint!
    var animationViewCenter:CGPoint!
    var cloud01Center:CGPoint!
    var cloud02Center:CGPoint!
    var conv04OriginalCenter:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up
        actionsViewCenter = actionsView.center
        actionsView.center.y = actionsViewCenter.y + 10
        actionsView.alpha = 0
        
        textViewCenter = textView.center
        textView.center.y = textViewCenter.y + 10
        textView.alpha = 0

        animationViewCenter = animationView.center
        animationView.center.y = animationViewCenter.y + 10
        animationView.alpha = 0

        conv04.alpha = 0

        cloud01Center = cloud01.center
        cloud02Center = cloud02.center
        conv04OriginalCenter = conv04.center

        // Go!
        stepOne()
        setupClouds()
        setupDevices()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func stepOne() {
        delay(0.7, closure:{ () -> Void in
            // Logo
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
                self.logoY.transform = CGAffineTransformMakeScale(1.2, 1.2)
                self.logoY.alpha = 0
                }, completion: nil)
            UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
                self.logoSP0.transform = CGAffineTransformMakeScale(1.2, 1.2)
                self.logoSP0.alpha = 0
                }, completion: nil)
            UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
                self.logoSP1.transform = CGAffineTransformMakeScale(1.2, 1.2)
                self.logoSP1.alpha = 0
                }, completion: nil)
            UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
                self.logoSP2.transform = CGAffineTransformMakeScale(1.2, 1.2)
                self.logoSP2.alpha = 0
                }, completion: nil)
            
            // Actions
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.actionsView.center = self.actionsViewCenter
                self.actionsView.alpha = 1
            })
            
            delay(0.25, closure:{ () -> Void in
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.textView.center = self.textViewCenter
                    self.textView.alpha = 1
                })
            })
            
            delay(0.4, closure:{ () -> Void in
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.animationView.center = self.animationViewCenter
                    self.animationView.alpha = 1
                })
            })

            
        })
    }
    
    func setupClouds() {
        UIView.animateWithDuration(4.5, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
            self.cloud01.center.x = self.cloud01Center.x - 10
            }, completion: nil)
        UIView.animateWithDuration(6.5, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
            self.cloud02.center.x = self.cloud02Center.x + 10
            }, completion: nil)
        
        // and clock
        clockView.layer.anchorPoint = CGPointMake(0.5, 1.0)
        UIView.animateWithDuration(90, delay: 0, options: [.Repeat, .CurveLinear], animations: { () -> Void in
            
            self.clockView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2*2))
            }, completion: nil)

    }
    
    func setupDevices() {
        UIView.animateWithDuration(0.4, delay: 1.1, options: .CurveEaseOut, animations: { () -> Void in
            self.phoneView.center.x = self.phoneView.center.x - 15
            self.computerView.center.x = self.computerView.center.x + 15
            }) { (Bool) -> Void in
                delay(1, closure:{ () -> Void in
                    self.moveConv01()
                })
        }
    }
    
    func moveConv01() {
        let center = conv01.center
        conv01.center.y = center.y + 10
        UIView.animateWithDuration(0.15, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            self.conv01.center.y = center.y
            self.conv01.alpha = 1
            }, completion: nil)
        UIView.animateWithDuration(0.2, delay: 3, options: .CurveEaseOut, animations: { () -> Void in
            self.conv01.center.y = center.y - 10
            self.conv01.alpha = 0
            }) { (Bool) -> Void in
                delay(1, closure:{ () -> Void in
                    self.conv01.center = center
                    self.moveConv02()
                })
        }
    }

    func moveConv02() {
        let center = conv02.center
        conv02.center.y = center.y + 10
        UIView.animateWithDuration(0.15, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            self.conv02.center.y = center.y
            self.conv02.alpha = 1
            }, completion: nil)
        UIView.animateWithDuration(0.2, delay: 3, options: .CurveEaseOut, animations: { () -> Void in
            self.conv02.center.y = center.y - 10
            self.conv02.alpha = 0
            }) { (Bool) -> Void in
                delay(1, closure:{ () -> Void in
                    self.conv02.center = center
                    self.moveConv03()
                })
        }
    }

    func moveConv03() {
        let center = conv03.center
        conv03.center.y = center.y + 10
        UIView.animateWithDuration(0.15, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            self.conv03.center.y = center.y
            self.conv03.alpha = 1
            }, completion: nil)
        UIView.animateWithDuration(0.2, delay: 3, options: .CurveEaseOut, animations: { () -> Void in
            self.conv03.center.y = center.y - 10
            self.conv03.alpha = 0
            }) { (Bool) -> Void in
                delay(1, closure:{ () -> Void in
                    self.conv03.center = center
                    self.moveConv04()
                })
        }
    }

    func moveConv04() {
        let center = conv04OriginalCenter
        conv04.center = conv04OriginalCenter
        conv04.alpha = 1
        UIView.animateWithDuration(0.4, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            self.conv04.center.y = center.y - 100
            self.conv04.transform = CGAffineTransformMakeRotation(-0.0872665)
            }, completion: nil)

        UIView.animateWithDuration(0.7, delay: 2, options: .CurveEaseOut, animations: { () -> Void in
            self.conv04.center.y = center.y
            self.conv04.transform = CGAffineTransformMakeRotation(0.0872665)
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 2, options: .CurveEaseOut, animations: { () -> Void in
            self.conv04.center.x = center.x + 150
            }, completion: nil)
        delay(3, closure:{ () -> Void in
            self.moveConv05()
        })
    }
    
    func moveConv05() {
        let center = conv05.center
        conv05.center.y = center.y + 10
        UIView.animateWithDuration(0.15, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            self.conv05.center.y = center.y
            self.conv05.alpha = 1
            }, completion: nil)
        UIView.animateWithDuration(0.2, delay: 3, options: .CurveEaseOut, animations: { () -> Void in
            self.conv05.center.y = center.y - 10
            self.conv05.alpha = 0
            }) { (Bool) -> Void in
                delay(1, closure:{ () -> Void in
                    self.conv05.center = center
                    self.moveConv06()
                })
        }
    }
    
    func moveConv06() {
        let center = conv06.center
        conv06.center.y = center.y + 10
        UIView.animateWithDuration(0.15, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            self.conv06.center.y = center.y
            self.conv06.alpha = 1
            }, completion: nil)
        UIView.animateWithDuration(0.2, delay: 3, options: .CurveEaseOut, animations: { () -> Void in
            self.conv06.center.y = center.y - 10
            self.conv06.alpha = 0
            }) { (Bool) -> Void in
                delay(1, closure:{ () -> Void in
                    self.conv06.center = center
                    self.moveConv07()
                })
        }
    }

    func moveConv07() {
        let center = conv07.center
        conv07.center.y = center.y + 10
        UIView.animateWithDuration(0.15, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            self.conv07.center.y = center.y
            self.conv07.alpha = 1
            }, completion: nil)
        UIView.animateWithDuration(0.2, delay: 3, options: .CurveEaseOut, animations: { () -> Void in
            self.conv07.center.y = center.y - 10
            self.conv07.alpha = 0
            }) { (Bool) -> Void in
                delay(1, closure:{ () -> Void in
                    self.conv07.center = center
                    self.moveConv01()
                })
        }
    }

    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
